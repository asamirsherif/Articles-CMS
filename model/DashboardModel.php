<?php
    class DashboardModel extends Model {
        public function addPost($category_id, $userId, $post_header, $post_content, $uploadedFile) {

            // 1: insert File 
            $sql = 'INSERT INTO file (name, image, thumb, size) VALUES (:name, :image, :thumb, :size)';
            $obj = $this->db->prepare($sql);
    
            $result1 = $obj->execute(array(
                ':name' => $uploadedFile['name'],
                ':image' => $uploadedFile['image'],
                ':thumb' => $uploadedFile['thumb'],
                ':size' => $uploadedFile['size'],
            ));
    
            // Remember the id of the new file entry
            $file_id = $this->db->lastInsertId();

            // 2: insert Post 
            $sql = 'INSERT INTO posts(header, content, user_id, file_id, category_id) VALUES (:header, :content, :user_id, :file_id, :category_id)';
            $obj = $this->db->prepare($sql);
            
            $result2 = $obj->execute(array(
                ":header" => $post_header,
                ":content" => $post_content,
                ":user_id" => $userId,
                ":file_id" => $file_id,
                ":category_id" => $category_id,
            ));
    
            return $result1 && $result2;
        }

        public function getPosts() {
            $sql = 'SELECT user.firstname, user.lastname, file.image, file.thumb, category.category_name, posts.*
                    FROM user
                    JOIN posts
                    ON user.id = posts.user_id
                    JOIN file
                    ON file.id = posts.file_id
                    JOIN category
                    ON category.id = posts.category_id ORDER BY timestamp DESC';
            
            $obj = $this->db->prepare($sql);
            
            $obj->execute();
            
            if ($obj->rowCount() > 0) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }
    
            return false;
        }

        // -- Categories functions
        public function getCategories() {
            $sql = "SELECT * FROM category WHERE 1";
            $obj = $this->db->prepare($sql);
    
            $obj->execute();
    
            if($obj->rowCount() > 0) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }
    
            return false;
        }

        public function insertCategory($categoryName) {
            $sql = "INSERT INTO category(category_name) VALUES (:category_name)";
            $obj = $this->db->prepare($sql);
    
            $obj->execute(array(
                ":category_name" => $categoryName
            ));
    
            if($obj->rowCount() > 0) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }
    
            return false;
        }

        //---------------------------------------



        // upload user image

        public function uploadUserImage($userId, $uploadedFile) {
            // 1. Step: insert File ----------------------------------------------------
            $sql = 'INSERT INTO file (name, image, thumb, size) VALUES (:name, :image, :thumb, :size)';

            $obj = $this->db->prepare($sql);

            $result1 = $obj->execute(array(
                ':name' => $uploadedFile['name'],
                ':image' => $uploadedFile['image'],
                ':thumb' => $uploadedFile['thumb'],
                ':size' => $uploadedFile['size'],
            ));

            // Remember the id of the new file entry
            $file_id = $this->db->lastInsertId();

            // 2. Step: insert Post ---------------------------------------------------
            $sql = "UPDATE user SET file_id = :file_id WHERE id = :id";

            $obj = $this->db->prepare($sql);
            
            $result2 = $obj->execute(array(
                ":id" => $userId,
                ":file_id" => $file_id,
            ));

            return $result1 && $result2;
        }

        // ----------------------------------------------------------------------------------

        // user functions

        public function getAllUsers() {
            $sql = 'SELECT user.*, user_permission.permission FROM user LEFT JOIN user_permission ON permission_id = user_permission.id ORDER BY user.email ASC';
            $obj = $this->db->prepare($sql);
    
            $obj->execute();
    
            $result = $obj->fetchAll(PDO::FETCH_OBJ);
    
            return $result;
        }

        public function updatePermission($permission, $userEmail) {
            $sql = "UPDATE `user` SET permission_id = :permission WHERE email = :email";

            $obj = $this->db->prepare($sql);

            $obj->execute(array(
                ":permission" => $permission,
                ":email" => $userEmail
            ));
        }

        public function unbanUser($userEmail) {
            $sql = 'UPDATE user SET login_attempts = 0 WHERE email = :email';
            $obj = $this->db->prepare($sql);
    
            $result = $obj->execute(array(
                ":email" => $userEmail
            ));
    
            return $result;
        }

        public function banUser($userEmail) {
            $sql = 'UPDATE user SET login_attempts = 3 WHERE email = :email';
            $obj = $this->db->prepare($sql);
    
            $result = $obj->execute(array(
                ":email" => $userEmail
            ));
    
            return $result;
        }


        // --------------------------------------------------------------------


    }