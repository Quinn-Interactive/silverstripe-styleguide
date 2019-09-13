<?php

namespace BenManu\StyleGuide;

use SilverStripe\Control\Controller;
use SilverStripe\Control\Director;
use SilverStripe\View\ViewableData;
use SplFileObject;

/**
 * Section
 *
 * A Comment Block that represents a single section.
 */
class Section extends ViewableData {

    /**
     * The raw Comment Block
     *
     * @var string
     */
    protected $rawComment = '';

    /**
     * The file where the Comment Block came from
     *
     * @var \SplFileObject
     */
    protected $file = null;

    /**
     * Creates a section with the Comment Block and source file
     *
     * @param string $comment
     * @param \SplFileObject $file
     */
    public function __construct($comment = '', \SplFileObject $file = null) {
        $this->rawComment = $comment;
        $this->file = $file;
    }

    /**
     * Returns the source filename for where the comment block was located
     *
     * @return string
     */
    public function getFilename() {
        if ($this->file === null) {
            return '';
        }

        return $this->file->getFilename();
    }

    /**
     * Render a SilverStripe template with fixture data if set.
     * @param  String $template The name of the template.
     * @return String           HTMLText string of the rendered template.
     */
    public function getRenderedTemplate($template) {
        $controller = Controller::curr();
        $fixture = $controller->getFixture();

        // if the factory is set and the fixture object exists render the template with
        // the object.
        if($fixture) {
            if(array_key_exists($template, $fixture)) {
                $obj = $fixture[$template];
                return $obj->renderWith($template);
            }
        }

        return $controller->renderWith($template);
    }

    /**
     * Returns the path to the source filename for where the comment block was located
     *
     * @return string
     */
    public function getFileType() {
        $path = $this->getPathname();
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        return strtolower($ext);
    }

    /**
     * Returns the path to the source filename for where the comment block was located
     *
     * @return string
     */
    public function getPathname() {
        if ($this->file === null) {
            return '';
        }
        $root = Director::baseFolder();
        $path = $this->file->getPathname();
        return substr($path,strlen($root));
    }

    /**
     * Return a DBText object with the source of the file
     * @return String   Text string of the file.
     */
    public function getFileSource() {
        $file = $this->file;
        if ($file) {
            $file->rewind();
            $source = $file->fread($file->getSize());
            return htmlentities($source);
        }
        return false;
    }

}
