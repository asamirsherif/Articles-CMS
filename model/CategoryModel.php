<?php
    class CategoryModel extends Model {

        public function getPosts() {
            $sql = 'SELECT user.firstname, user.lastname, file.image, file.thumb, category.category_name, posts.*
                    FROM user
                    JOIN posts
                    ON user.id = posts.user_id
                    JOIN file
                    ON file.id = posts.file_id
                    JOIN category
                    ON category.id = posts.category_id';
            
            $obj = $this->db->prepare($sql);
            
            $obj->execute();
            
            if ($obj->rowCount() > 0) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }
    
            return false;
        }


        public function getPostById($id) {
            $sql = 'SELECT user.firstname, user.lastname, file.image, file.thumb, category.category_name, posts.*
            FROM user
            JOIN posts
            ON user.id = posts.user_id
            JOIN file
            ON file.id = posts.file_id
            JOIN category
            ON category.id = posts.category_id WHERE posts.id = :id';
    
            $obj = $this->db->prepare($sql);
    
            $obj->execute(array(
                ":id" => $id
            ));
            
            if($obj->rowCount() > 0) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }
        
            return false;
        }
        
        public function getPostsByCategoryId($id, $search) {
            $sql = 'SELECT user.firstname, user.lastname, file.image, file.thumb, category.category_name, posts.*
            FROM user
            JOIN posts
            ON user.id = posts.user_id
            JOIN file
            ON file.id = posts.file_id
            JOIN category
            ON category.id = posts.category_id
            WHERE category.id = :id AND posts.header LIKE :search';

            $obj = $this->db->prepare($sql);

            $result = $obj->execute(array(
                ":id" => $id,
                ':search' => '%'.$search.'%'
            ));

            if ($result) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }

            return false;
        }


        # **********************
        # Comment feature SQL 
        # **********************

        public function getAllCommentsById($id) {
            $sql = 'SELECT
            USER.firstname,
            USER.lastname,
                comments.*
            FROM
                comments
            LEFT JOIN USER ON USER.id = comments.user_id
            WHERE post_id = :post_id';

            $obj = $this->db->prepare($sql);

            $obj->execute(array(
                ":post_id" => $id
            ));
            
            if ($obj->rowCount() > 0) {
                $data = $obj->fetchAll(PDO::FETCH_OBJ);
                return $data;
            }
    
            return false;
        }

        public function userComment($user_comment, $postId) {
            $sql = 'INSERT INTO comments(comment_content, user_id, post_id) VALUES (:comment_content, :user_id, :post_id)';
            $obj = $this->db->prepare($sql);
            $obj->execute(array(
                ":comment_content" => $user_comment,
                ':user_id' => Session::get('user')['id'],
                ":post_id" => $postId
            ));
        }
        
    }