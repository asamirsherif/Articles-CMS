<?php
    $messages = Message::getAll();
    Debug::add($messages, '$messages');
?>


<?php foreach($messages as $key => $value) : ?>
<div class="container">
        <div class="alert alert-<?= $value['class'] ?> position-fixed" data-time="<?= $value['time'] ?>" data-duration="<?= $value['duration'] ?>"><?= $value['text'] ?>

            <button type="button" href="<?=URL?>?deleteMessage=<?= $key ?>" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
            </button>

        </div>
    
</div>

<?php endforeach; ?>