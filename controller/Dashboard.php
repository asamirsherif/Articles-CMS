<?php
    class Dashboard extends Controller {
        /**
         * Add New Post
         */
        public function doAdd() {
            $post = $_POST;
            $category_id = $post['category_id'];
            $userId = Session::get('user')['id'];
            $post_header = trim($post['header']);
            $post_content = trim($post['content']);
            $post_file = $_FILES['post_file'];
    
            $uploadedFile = File::uploadImg($post_file);
            $this->model->addPost($category_id, $userId, $post_header, $post_content, $uploadedFile);
    
            Message::add('Perfect! New post has been added to your website');
            
            header('Location: ' . URL . 'dashboard/add');
        }

        # Rendering the add Page - Only accessible if Admin status
        public function add() {
            if(Session::get('user')['permission'] == "Admin") { 
                $data = $this->model->getCategories();
                $this->view->data = $data;
                $this->view->render('dashboard/add');
            } else {
                header('Location: ' . URL . 'dashboard');
            }
        }

        /**
         * View all posts
         */
        public function view() {
            if(!(Session::get('user'))) {
                Header("Location: " . URL . "home");
            } else {
                $posts = $this->model->getPosts();
                $this->view->posts = $posts;
                $this->view->render('dashboard/view');
            }
        }


        // Category Functions ---------------------------------------

        
        public function category() {
            if(!(Session::get('user'))) {
                header("Location: " . URL . "home");
            } else { 
                $this->view->render('dashboard/category');

            }
        }

        public function addCategory() {
            $getCategory = $_POST['category'];
            $this->model->insertCategory($getCategory);
            header("Location: " . URL . "dashboard/category");
        }

        // --------------------------------------------------------

        public function index() {
            if(!(Session::get('user'))) {
                Header("Location: " . URL . "home");
            } else {
                $this->view();
            }
        }


        // User Functions 

        public function allUsers() {
            $allPermissions = $this->model->getAllPermissions();
            $allUsers = $this->model->getAllUsers();
            $this->view->allUsers = $allUsers;
            $this->view->allPermissions = $allPermissions;
            $this->view->render('dashboard/allUsers');
        }

        public function unbanUser() {
            $userEmail = explode("/", $_GET["url"]);
            $this->model->unbanUser($userEmail[2]);
            header("Location: " . URL . "dashboard/allUsers");
        }

        public function banUser() {
            $userEmail = explode("/", $_GET["url"]);
            $this->model->banUser($userEmail[2]);
            header("Location: " . URL . "dashboard/allUsers");
        }

        public function updatePermission() {
            $permission = $_POST['permission_id'];
            $userEmail = explode("/", $_GET["url"]);
            $this->model->updatePermission($permission ,$userEmail[2]);
            header("Location: " . URL . "dashboard/allUsers");
        }


        // -------------------------------------------------------------

        
    }