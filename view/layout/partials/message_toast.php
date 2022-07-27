<?php
    $messages = Message::getAll();
    Debug::add($messages, '$messages');
?>


<?php foreach($messages as $key => $value) : ?>
<div class="container">
        <div class="alert alert-<?= $value['class'] ?> position-fixed" data-time="<?= $value['time'] ?>" data-duration="<?= $value['duration'] ?>"><?= $value['text'] ?>
        
            <a class="close" href="?deleteMessage=<?= $key ?>" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </a>
        </div>
    
</div>

<!-- <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
  <div class="toast" style="position: absolute; top: 0; right: 0;">
    <div class="toast-header">
      <img src="..." class="rounded mr-2" alt="...">
      <strong class="mr-auto"></strong>
      <small><?= $value['time'] ?></small>
      <button type="button" href="?deleteMessage=<?= $key ?>" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="toast-body">
    <?= $value['text'] ?>
    </div>
  </div>
</div> -->

<?php endforeach; ?>