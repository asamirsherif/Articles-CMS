<?php
    $messages = Message::getAll();
    Debug::add($messages, '$messages');
?>


<?php foreach($messages as $key => $value) : ?>
<div class="container">
        <div class="alert alert-<?= $value['class'] ?> position-fixed" data-time="<?= $value['time'] ?>" data-duration="<?= $value['duration'] ?>"><?= $value['text'] ?>

            <button type="button" class="close">
                <a href="?deleteMessage=<?= $key ?>" aria-hidden="true">&times;</a>
            </button>

        </div>
    
</div>

<?php endforeach; ?>