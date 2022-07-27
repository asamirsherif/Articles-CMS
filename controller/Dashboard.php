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


        //  USER PROFILE FUNCTIONS 

        public function editProfile() {
            if(!(Session::get('user'))) {
                Header("Location: " . URL . "home");
            } else { 
                $userEmail = Session::get('user')['email'];
                $userImgThumb = Session::get('user')['thumb'];
        
                $userData = $this->model->getUserFromEmail($userEmail);
                $this->view->userData = $userData;
                $this->view->userImg = $userImgThumb;
                $this->view->render('dashboard/editProfile');
            }
        }

        public function doUpdateUser() {
            $post = $_POST;
            $post_firstname = $_POST['firstname'];
            $user = Session::get('user');
            $user_id = $user['id'];
            $post_lastname = $_POST['lastname'];
            $post_email = $_POST['email'];
            $post_password = $_POST['password'];
            $file_id = $_POST['file_id'];
            $new_foto = $_FILES['new_foto'];
            $userEmail = $user['email'];
            $userData = $this->model->getUserFromEmail($userEmail);
            $this->view->userData = $userData;

            if (!$new_foto['error']) {
                
                $uploadedFile = File::uploadImg($new_foto);
                
                if(!empty($user['image'])) {
                    File::delete($user['thumb']);
                    File::delete($user['image']);
                }
                
                if($user['file_id'] === NULL) {
                    $this->model->uploadUserImage($user_id, $uploadedFile);
                } else {
                    $this->model->updateFile($file_id, $uploadedFile);
                }   
            }
            
            $this->view->post = $post;
            $this->model->editProfile($user_id, $post_firstname, $post_lastname, $post_email, $post_password);
            $updatedUser = $this->model->getUserById($user['id']);
            // Debug::add($updatedUser);
            Session::set("user", $updatedUser); 
            // $this->view->render('dashboard/editProfile');
            header('Location: ' . URL . 'dashboard/editProfile');        
        }

        // ----------------------------------------------------------------------------

    }