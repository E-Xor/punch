$(function(){
    $('img.destroyEmployee').click(function(e){
        e.stopPropagation();
        console.log('clicked!');
        console.log($(e.target).attr('employee_id'));
        if(confirm('Are you sure you want to delete an employee?')) {
            var id = $(e.target).attr('employee_id');

            $.ajax({
                type: 'DELETE',
                headers: {
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
                },
                url: '/employees/' + id,
                success: function(data, status, xhr) {
                    alert(data.message);
                    window.location.replace("/employees");
                },
                error: function(xhr, status, error) {
                    alert('Error happened during employee deletion.');
                    window.location.replace("/employees");
                }
            });    
      }
    });

});