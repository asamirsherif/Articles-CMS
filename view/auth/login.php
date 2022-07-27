<?php
    $emailError = isset($this->email_err) ? true : false;
    $emailErrorMsg = isset($this->email_err) ? $this->email_err : '';
?>

<section class="h-100" style="background-color: #3828c5;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">

      <?php if($emailError) : ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <?= $emailErrorMsg ?>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
    <?php endif; ?>

        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="<?=URL?>public\img\login-bg-laptop.jpg"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="<?=URL?>auth/doLogin" method="POST">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <a href="<?=URL?>"> <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span id="title" class="h1 fw-bold mb-0"><?=SITENAME?></span>
                    </a>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div class="form-outline mb-4">
                    <input type="email" name="email" id="form2Example17" class="form-control form-control-lg <?= ($emailError) ? 'is-invalid' : '' ?>" />
                    <label class="form-label"  for="form2Example17">Email address</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input name="password" type="password" id="form2Example27" class="form-control form-control-lg <?= ($emailError) ? 'is-invalid' : '' ?>" />
                    <label class="form-label" for="form2Example27">Password</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                  </div>

                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="<?=URL?>auth/register"
                      style="color: #393f81;">Register here</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
document.body.style.padding = '0rem'; 
</script>
