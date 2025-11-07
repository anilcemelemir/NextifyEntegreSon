<footer class="footer">
    <span>Copyright &copy; 2025 Nextify <b>MÜŞTERİ</b>PANELİ</span>
</footer>
</section>
<!-- ============================================================== -->
<!-- 						Content End		 						-->
<!-- ============================================================== -->
<!-- Common Plugins -->
<script src="../admin/assets/lib/jquery/dist/jquery.min.js"></script>
<script src="../admin/assets/lib/bootstrap/js/popper.min.js"></script>
<script src="../admin/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../admin/assets/lib/pace/pace.min.js"></script>
<script src="../admin/assets/lib/jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<script src="../admin/assets/lib/slimscroll/jquery.slimscroll.min.js"></script>
<script src="../admin/assets/lib/nano-scroll/jquery.nanoscroller.min.js"></script>
<script src="../admin/assets/lib/metisMenu/metisMenu.min.js"></script>
<script src="../admin/assets/js/custom.js"></script>
<script src="../admin/assets/dropzone/dropzone.js"></script>

<!--Chart Script-->
<script src="../admin/assets/lib/chartJs/Chart.min.js"></script>
<?php echo $motorprint['motor_analitik']; ?>
<?php echo $motorprint['motor_metrika']; ?>
<?php echo $settingsprint['ayar_kod']; ?>

<!--Vetor Map Script-->
<script src="../admin/assets/lib/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="../admin/assets/lib/vectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Datatables-->
<script src="../admin/assets/lib/datatables/jquery.dataTables.min.js"></script>
<script src="../admin/assets/lib/datatables/dataTables.responsive.min.js"></script>
<script src="../admin/assets/lib/datatables/dataTables.buttons.min.js"></script>
<script src="../admin/assets/lib/datatables/jszip.min.js"></script>
<script src="../admin/assets/lib/datatables/pdfmake.min.js"></script>
<script src="../admin/assets/lib/datatables/vfs_fonts.js"></script>
<script src="../admin/assets/lib/datatables/buttons.html5.min.js"></script>
<!-- Jquery Steps -->
<script src="../admin/assets/lib/jquery-steps/jquery.steps.min.js"></script>
<script src="../admin/assets/lib/jquery-validate/jquery.validate.min.js"></script>
<script>
$("#example-basic").steps({
    headerTag: "h3",
    bodyTag: "section",

    autoFocus: true
});

$("#example-vertical").steps({
    headerTag: "h3",
    bodyTag: "section",
    transitionEffect: "slideLeft",
    stepsOrientation: "vertical"
});

//steps with form
var form = $("#example-form");
form.validate({
    errorPlacement: function errorPlacement(error, element) {
        element.before(error);
    },
    rules: {
        confirm: {
            equalTo: "#password"
        }
    }
});
form.children("div").steps({
    headerTag: "h3",
    bodyTag: "section",
    transitionEffect: "slideLeft",
    onStepChanging: function(event, currentIndex, newIndex) {
        form.validate().settings.ignore = ":disabled,:hidden";
        return form.valid();
    },
    onFinishing: function(event, currentIndex) {
        form.validate().settings.ignore = ":disabled";
        return form.valid();
    },
    onFinished: function(event, currentIndex) {
        alert("Submitted!");
    }
});
</script>
<script>
$(document).ready(function() {
    $('#datatable2').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    });

});
</script>
<script>
$(document).ready(function() {
    $('#datatable1').dataTable();
});
</script>
<!-- Summernote -->
<script src="../admin/assets/lib/summernote/summernote.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('.summernote').summernote({
        height: '300px',
    });
});
</script>
<script>
CKEDITOR.replace('editor');
</script>
<!--Sweet Alerts-->
<script src="../admin/assets/lib/sweet-alerts2/sweetalert2.min.js"></script>
<?php if (@$_SESSION['status']=="demo") { ?>
<script>
$(document).ready(function() {
    swal({
        title: "OoPs!",
        text: "Demo Modda İşlem Yapılamaz!",
        type: "warning",
        showConfirmButton: false,
        timer: '2000'
    });
});
</script>

<?php unset($_SESSION['status']); }  ?>
<?php if ($_GET['status']=='ok') { ?>
<script>
$(document).ready(function() {
    swal({
        title: "TAMAMLANDI!",
        text: "İşlem başarılı bir şekilde tamamlandı",
        type: "success",
        timer: '1000',
        showConfirmButton: false
    });
});
</script>
<?php  
    $sayfaURL = "http";
    if(isset($_SERVER["HTTPS"])){
      if($_SERVER["HTTPS"] == "on"){
        $sayfaURL .= "s";
      }
    }
    $sayfaURL .= "://";
    $sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="1; URL=<?php echo substr($sayfaURL,0, -10);?>">
<?php } elseif ($_GET['status']=='no') {?>
<script>
$(document).ready(function() {
    swal({
        title: "HATA!",
        text: "İşlem sırasında bir hata oluştu.",
        type: "error",
        showConfirmButton: false,
        timer: '1000'
    });
});
</script>
<?php  
  $sayfaURL = "http";
  if(isset($_SERVER["HTTPS"])){
    if($_SERVER["HTTPS"] == "on"){
      $sayfaURL .= "s";
    }
  }
  $sayfaURL .= "://";
  $sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="1; URL=<?php echo substr($sayfaURL,0, -10);?>">
<?php } elseif ($_GET['status']=='eksik') {?>
<script>
$(document).ready(function() {
    swal({
        title: "RESİM SEÇMEDİNİZ!",
        text: "En az bir tane arkaplan seçiniz.",
        type: "error",
        showConfirmButton: false,
        timer: '2000'
    });
});
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="2; URL=<?php echo substr($sayfaURL,0, -13);?>">
<?php } elseif ($_GET['captcha']=='no') {?>
<script>
$(document).ready(function() {
    swal({
        title: "HATA!",
        text: "reCaptcha doğrulama alanını boş bırakmayınız!",
        type: "warning",
        showConfirmButton: false,
        timer: '3000'
    });
});
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="3; URL=<?php echo substr($sayfaURL,0, -11);?>">
<?php } elseif ($_GET['demo']=='ok') {?>
<script>
$(document).ready(function() {
    swal({
        title: "OoPs!",
        text: "Demo modda düzenlemeye izin verilmiyor.<br />",
        type: "warning",
        showConfirmButton: false,
        timer: '2000'
    });
});
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="2; URL=<?php echo substr($sayfaURL,0, -8);?>">
<?php } elseif ($_GET['status']=='smssure') { 


  ?>
<script>
$(document).ready(function() {
    swal({
        title: "UYARI!",
        text: "SMS gönderimi için 20 dakika beklemelisiniz. <br> Kalan süre  <?php echo $kalanSure ?> Dakikadır.",
        type: "warning",
        showConfirmButton: false,
        timer: '5000'
    });
});
</script>
<?php  
$sayfaURL = "http";
if(isset($_SERVER["HTTPS"])){
  if($_SERVER["HTTPS"] == "on"){
    $sayfaURL .= "s";
  }
}
$sayfaURL .= "://";
$sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="5; URL=<?php echo substr($sayfaURL,0, -15);?>">
<?php } 
if ($_GET['uyeonay']=="no") { ?>
<script>
$(document).ready(function() {
    swal({
        title: "ÜYELİĞİNİZİ ONAYLAYIN!",
        text: "Satın alma vb. işlemlemleri gerçekleştirebilmek için lütfen üyeliğinizi onaylayın.",
        type: "error",
        timer: '4000',
        showConfirmButton: false
    });
});
</script>
<?php  
  $sayfaURL = "http";
  if(isset($_SERVER["HTTPS"])){
    if($_SERVER["HTTPS"] == "on"){
      $sayfaURL .= "s";
    }
  }
  $sayfaURL .= "://";
  $sayfaURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"]; ?>
<meta http-equiv="refresh" content="4; URL=uye-onay">
<?php
}


?>
</body>

</html>