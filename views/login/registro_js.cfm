<script src="/includes/js/jquery-3.1.1.min.js"></script>
<script src="/includes/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/includes/js/plugins/iCheck/icheck.min.js"></script>
<script>
	
    $(document).ready(function(){
    	$('#tc').hide();
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        }).on('ifChanged', function(e) {
    		var isChecked = e.currentTarget.checked;
    		if (isChecked == true) {
    			$(".tc").prop('disabled', false);
                $("#estado").attr('value',1);
    			estado = 2;
		
    		}else{
    			$(".tc").prop('disabled', true);
    			$("#estado").attr('value',0);
    		}
		});
    });
        
</script>
