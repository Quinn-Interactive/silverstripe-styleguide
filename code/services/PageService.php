<?php

/**
 * PageService
 */

namespace BenManu\StyleGuide;

use SilverStripe\View\ArrayData;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\Parsers\URLSegmentFilter;
use BenManu\StyleGuide\StyleGuide;

class PageService {

    protected $pages;

    protected $controller;

    public function __construct($controller) {
        $this->controller = $controller;
        $this->setPages();
    }

    private function setPages() {
        $pages = array();
        $path = project() . '/styleguide/pages.yml';

        if(YamlParser::hasYaml($path)) {
            $parser = new YamlParser($path);
            $pages = $parser->get('Page');
        }

        if(!$pages || empty($pages)) {
            $pages = array();
        }

        // add the styleguide page
        $children = $this->controller->styleguide_service->getNavigation();

        foreach($children as $child) {
            $child->request = $this->controller->request;
            $child->setField('Template', StyleGuide::class);
        }

        $pages = array_merge(array('StyleGuide' => new ArrayData(array(
            'ID'        => 'styleGuide',
            'Title'     => 'Style Guide',
            'Children'  => $children
        ))), $pages);

        $this->pages = $pages;
    }

    public function getPages() {
        $navigation = new ArrayList();

        // Add the custom navigation.
        if(isset($this->pages)) foreach($this->pages as $item) {
            if(isset($item->Title)) {
                $title = $item->Title;
                $urlSegment = $this->fixURLSegment($title);
                $active = $this->isActive($urlSegment);
                $link = $this->controller->Link($urlSegment);

                $nav = array(
                    'Title'     => $title,
                    'Active'    => $active,
                    'Link'      => $link,
                    'Template'  => $item->Template
                );

                // if active and has children
                if($active && isset($item->Children)) {
                    $children = new ArrayList();

                    foreach($item->Children as $childItem) {
                        $childTitle = $childItem->Title;
                        $childUrlSegment = ($item->ID == "styleGuide" ? $childItem->getLink() : $this->fixURLSegment($childTitle));
                        $childActive = $this->isActive($urlSegment, $childUrlSegment);
                        $childLink = $this->controller->Link($urlSegment, $childUrlSegment);

                        $childNav = array(
                            'Title'     => $childTitle,
                            'Active'    => $childActive,
                            'Link'      => $childLink,
                            'Template'  => $childItem->Template
                        );

                        $children->push(new ArrayData($childNav));
                    }

                    $nav['Children'] = $children;
                }

                // $nav = array_merge($item, $nav);

                $navigation->push(new ArrayData($nav));
            }
        }

        return $navigation;
    }

    public function getActivePage() {
        $pages = $this->getPages();
        foreach($pages as $page) {
            if($page->Active) {

                // check if there's an active child.
                if($page->Children) foreach($page->Children as $child) {
                    if($child->Active) {
                        return $child;
                    }
                }

                return $page;
            }
        }
    }

    public function getTemplate() {
        $page = $this->getActivePage();

        if($page && $page->Template) {
            return $page->Template;
        }

        return null;
    }

    /**
     * Given the URLSegment we're about to set, ensure this
     * is valid in SilverStripe, and update it if required.
     *
     * @param string $rawSegment
     * @return string A filtered path compatible with RFC 3986
     */
    protected function fixURLSegment($rawSegment) {
        $filter = URLSegmentFilter::create();
        return $filter->filter($rawSegment);
    }

    /**
     * Check if a link is active.
     * @return boolean
     */
    public function isActive($action, $childAction = null) {
        $check = $this->controller->request->param('Action') == $action;

        if($childAction && $check) {
            $check = $this->controller->request->param('ChildAction') == $childAction;
        }

        return $check;
    }

}
