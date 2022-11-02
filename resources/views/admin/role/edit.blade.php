@extends('admin.layouts.app')

@section('content')

      <!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Edit Role</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="index.php"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Role</li>
                </ol>
            </nav>
        </div>
        <div class="ms-auto">
            <div class="btn-group">
                <a href="{{route('roles.index')}}" class="btn btn-primary"><i class="bi bi-arrow-left"></i> Back to Manage Role</a>
            </div>
        </div>
    </div>
    <!--end breadcrumb-->
    <div class="row">
        <div class="col-12 col-lg-12">
            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="mb-0">Edit Role</h5>
					{{Session::get('error')}}
                    <hr>
                    <div class="card shadow-none">
                        <div class="card-body">
                            <form class="customer_form row g-3" method="POST" action="{{route('roles.update',['role'=>$role->id])}}">
							@csrf
							@method('PUT')
                                <div class="col-6 form-group">
                                    <label for="product-name">Name<span class="text-danger">*</span></label>
                                        <input type="text" name="name" value="{{$role->name}}" class="form-control" >
                                </div>
							
                              
                                <div class="col-12 text-end">
                                    <button type="submit" class="btn btn-success px-4">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

<script type="text/javascript">
    $(document).ready(function() {
        $("input[name='permission[]']").change(function() {
			
            event.preventDefault();
			var checkBoxes = $(this).parent().closest('.checkbox-success').find(':checkbox');
		  
			checkBoxes.prop('checked', $(this).is(':checked') ? true : false);

        });
    });
</script>

@endsection
