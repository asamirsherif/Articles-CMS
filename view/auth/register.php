<?php 

    $formClass = isset($this->error) ? 'error' : '';

    $firstnameData = isset($this->formData['firstname']) ? $this->formData['firstname'] : '';
    $lastnameData = isset($this->formData['lastname']) ? $this->formData['lastname'] : '';
    $emailData = isset($this->formData['email']) ? $this->formData['email'] : '';
    $passwordData = isset($this->formData['password']) ? $this->formData['password'] : '';
    $confirmPasswordData = isset($this->formData['confirm_data']) ? $this->formData['confirm_data'] : '';
    
    $firstnameErr = isset($this->error['firstname']) ? 'is-invalid' : '';
    $lastNameErr = isset($this->error['lastname']) ? 'is-invalid' : '';
    $emailErr = isset($this->error['email']) ? 'is-invalid' : '';
    $passwordErr = isset($this->error['password']) ? 'is-invalid' : '';
    $confirmPasswordErr = isset($this->error['confirm_password']) ? 'is-invalid' : '';

    $nameErrorMsg = isset($this->error['name_err']) ? $this->error['name_err'] : '';
    $lastNameErrorMsg = isset($this->error['lastname_err']) ? $this->error['lastname_err'] : '';
    $emailErrorMsg = isset($this->error['email_err']) ? $this->error['email_err'] : '';
    $passwordErrorMsg = isset($this->error['password_err']) ? $this->error['password_err'] : '';
    $confirmPasswordErrorMsg = isset($this->error['confirm_password_err']) ? $this->error['confirm_password_err'] : '';

?>

<!-- <section>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-body bg-light mt-5">
            <h2>Create An Account</h2>
            <p>Please fill out this form to register with us</p>
            <form action="<?php echo URL; ?>auth/doRegister" method="POST" name="myForm">

                <div class="form-group">
                    <label for="name">Name: <sup>*</sup></label>
                    <input type="text" name="firstname" class="form-control form-control-lg <?= $firstnameErr ?>"  value="<?= $firstnameData ?>">
                    <span class="invalid-feedback"><?= $nameErrorMsg ?></span>
                </div>
 

                <div class="form-group">
                    <label for="name">Last Name: <sup>*</sup></label>
                    <input type="text" name="lastname" class="form-control form-control-lg <?= $lastNameErr ?>"  value="<?= $lastnameData ?>">
                    <span class="invalid-feedback"><?= $lastNameErrorMsg ?></span>
                </div>

                <div class="form-group">
                    <label for="email">Email: <sup>*</sup></label>
                    <input type="text" name="email" class="form-control form-control-lg <?= $emailErr ?>" value="<?= $emailData ?>">
                    <span class="invalid-feedback"><?= $emailErrorMsg ?></span>
                </div>        
                

                <div class="form-group">
                    <label for="name">Password: <sup>*</sup></label>
                    <input type="password" name="password" class="form-control form-control-lg <?= $passwordErr ?>" value="<?= $passwordData ?>">
                    <span class="invalid-feedback"><?= $passwordErrorMsg ?></span>
                </div>

                <div class="form-group">
                    <label for="confirm_password">Confirm Password: <sup>*</sup></label>
                    <input type="password" name="confirm_password" class="form-control form-control-lg <?= $confirmPasswordErr ?>" value="<?= $confirmPasswordData ?>">
                    <span class="invalid-feedback"><?= $confirmPasswordErrorMsg ?></span>
                </div>  

                <div class="row">
                    <div class="col">
                    <input type="submit" value="Register" class="btn btn-success btn-block">
                    </div>
                    <div class="col">
                    <a href="<?=URL?>auth/login" class="btn btn-light btn-block">Have an account? Login</a>
                    </div>
                </div>       
            </form>
        </div>
    </div>
</div>
</section>
<div class="mb-5"></div> -->

<!-- Section: Design Block -->
<section class="text-center">
  <!-- Background image -->
  <div class="p-5 bg-image" style="
        background-image: url('<?=URL?>public/img/bg-register.jpg');
        height: 300px;
        "></div>
  <!-- Background image -->

  <div class="card mx-4 mx-md-5 shadow-5-strong" style="
        margin-top: -100px;
        background: hsla(0, 0%, 100%, 0.8);
        backdrop-filter: blur(30px);
        ">
    <div class="card-body py-5 px-md-5">

      <div class="row d-flex justify-content-center">
        <div class="col-lg-8">
            <div class="fw-bold mb-5">
            <a href="<?=URL?>"> <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span id="title" class="h1 fw-bold mb-0"><?=SITENAME?></span>
                    </a>
            </div>
          <h2 class="fw-bold mb-5">Register and Join the community</h2>
          <form action="<?=URL?>auth/doRegister" method="POST" name="myForm">
            <!-- 2 column grid layout with text inputs for the first and last names -->
            <div class="row">
              <div class="col-md-6 mb-4">
                <div class="form-outline">
                  <input type="text" name="firstname" class="form-control <?= $firstnameErr ?>" />
                  <label class="form-label" for="fname">First name</label>
                </div>
              </div>
              <div class="col-md-6 mb-4">
                <div class="form-outline">
                  <input type="text" name="lastname" class="form-control <?= $lastnameErr ?>" />
                  <label class="form-label" for="lname">Last name</label>
                </div>
              </div>
            </div>

            <!-- Email input -->
            <div class="form-outline mb-4">
              <input type="email" name="email" class="form-control <?= $emailErr ?>" />
              <label class="form-label" for="email">Email address</label>
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
              <input type="password" name="password" class="form-control <?= $passwordnameErr ?>" />
              <label class="form-label" for="password">Password</label>
            </div>
            

            <!-- Password Confirm -->
            <div class="form-outline mb-4">
              <input type="password" name="confirm_password" class="form-control <?= $confirmPasswordErr ?>" />
              <label class="form-label" for="confirm_password">Confirm Password</label>
            </div>
            
            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">
              Sign up
            </button>

            <p class="mb-5 pb-lg-2" style="color: #393f81;">Already Registered? <a href="<?=URL?>auth/login"
                      style="color: #393f81;">Login here</a></p>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->


<script src="<?=URL?>public/js/validation.js"></script>
<script>
document.body.style.padding = '0rem';
document.getElementsByTagName('section')[0].style.padding = '0rem'; 
</script>