<?php

class View {

    //True if rendered
    private $rendered = false;

    public function render($name) {

        //Check if view has already been rendered
        if (!$this->rendered) {
            

            //Prevent double rendering
            $this->rendered = true;

            require 'view/layout/header.php';

            if(Session::get('controller_name') !== 'Auth') {
                
                require 'view/layout/navbar.php';
            }

            require 'view/layout/partials/message_toast.php';

            require 'view/' . $name . '.php';

            if(Session::get('controller_name') !== 'Dashboard' && Session::get('controller_name') !== 'Auth') {
                require 'view/layout/footer.php';
            }
            
            // Check DEBUG_MODE (config)
            if (DEBUG_MODE) {
                //Draw Debug-View
                require 'view/layout/debug.php';
            }
            
            require 'view/layout/footer_essentials.php';

        }

    }

}