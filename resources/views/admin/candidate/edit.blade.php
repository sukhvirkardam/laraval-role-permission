@extends('admin.layouts.app')

@section('content')

<!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Edit Candidate</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="index.php"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Candidate</li>
                </ol>
            </nav>
        </div>
        <div class="ms-auto">
            <div class="btn-group">
                <a href="{{route('candidate.index')}}" class="btn btn-primary"><i class="bi bi-arrow-left"></i> Back to Manage Candidate</a>
            </div>
        </div>
    </div>
    <!--end breadcrumb-->

    <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="mb-0">Edit Candidate</h5>
                            <hr>
                            <div class="steformdiv">
                                <form id="SignupForm" class="customer_form" action="{{route('candidate.update',$candidate->id)}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <fieldset class="row">
                                        <div class="col-12">
                                            <legend style="display:none;">Information</legend>
                                        </div>


                                         @fieldpermission('candidate-edit|logo_path')
                                        <div class="col-12 form-group">
                                            <div class="box-for-image  main-image">
                                                <div class="form-field-here add-product-image">
                                                    <label class="input-label">Profile Picture - (Max image size 2MB, Approx: 110px x 110px)
                                                    <span style="color: red">*</span></label> 
                                                    <div class="store-logo profile">
                                                        <img class="" src="{{ url('/') }}/{{$candidate->logo_path}}" >
														
                                                    </div>
                                                    <input type="file" id="add-pencil-icon" name="upload_file" value="{{$candidate->logo_path}}" class="btn-pencil-icon">
                                                </div>
                                            </div>
                                        </div>
                                        @endfieldpermission


                                         <!-- @fieldpermission('candidate-edit|relation_type')

                                        <div class="col-6">
                                            <label class="form-label">Relation with</label>
                                            <select class="form-select validate[required]" aria-label="Default select example" name="relation_type" >
                                                <option value="0">Select Company</option>
                                                @foreach($companies as $company)   
                                               
                                               <option value="{{$company->user_id}}">{{$company->name}}</option>
                                              
                                           @endforeach
                                            </select>
                                        </div>
                                        @endfieldpermission -->


                                         <!-- @fieldpermission('candidate-edit|relation_type')

                                        <div class="col-6">
                                            <label class="form-label">Relation with</label>
                                                <select class="form-select" aria-label="Default select example" name="relation_type" id="relation_type">
                                                    <option>Select Agency</option>
                                                    @foreach($agencies as $agency)   
                                                   
                                                   <option value="{{$agency->user_id}}">{{$agency->name}}</option>
                                                  
                                               @endforeach
                                                </select>
                                            </div>
                                            @endfieldpermission -->


                                         @fieldpermission('candidate-edit|plan_id')


										<div class="col-6">
                                                <label class="form-label">Plan <span>*</span></label>
                                                <select class="form-select validate[required]" aria-label="Default select example" name="plan" id="plan">
                                                    <!-- <option>Select Plan</option> -->
                                                    @foreach($plans as $plan)   
                                                   
                                                   <option value="{{$plan->id}}" @if($candidate->plan_id==$plan->id) selected @endif>{{$plan->name}}</option>
                                                  
                                               @endforeach
                                                </select>
                                            </div>
                                            @endfieldpermission


                                        
                                        <div class="row">


                                            @fieldpermission('candidate-create|registeration_Date')

                                            <div class="col-6 form-group">
                                                <label class="form-label">Date of Registration</label>
                                                <input type="date" id="registeration_Date" class="form-control" name="registeration_Date">
                                            </div>
                                             @endfieldpermission

                                             @fieldpermission('candidate-create|employee_id')

                                            <div class="col-6 form-group">
                                                <label class="form-label">Employee ID</label>
                                                <input type="text" id="employee_id" class="form-control" name="employee_id" placeholder="Enter Employee ID">
                                            </div>
                                             @endfieldpermission

                                         @fieldpermission('candidate-edit|email')

                                            <div class="col-6 form-group">
                                                <label class="form-label">Email Address <span>*</span></label>
                                                <input type="text" class="form-control" name="email" id="email" value="{{App\Models\User::getEmail($candidate->user_id)}}" disabled>
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|first_name')


                                            <div class="col-6">
                                                <label class="form-label">First Name <span>*</span></label>
                                                <input type="text" class="form-control" name="first_name" id="first_name" value="{{$candidate->first_name}}">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|middle_name')
                                            <div class="col-6">
                                                <label class="form-label">Middle Name <span>*</span></label>
                                                <input type="text" class="form-control" name="middle_name" id="middle_name" value="{{$candidate->middle_name}}">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|last_name')
                                            <div class="col-6">
                                                <label class="form-label">Last Name <span>*</span></label>
                                                <input type="text" class="form-control" name="last_name" id="last_name" value="{{$candidate->last_name}}">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|phone')


                                            <div class="col-6">
                                                <label class="form-label">Phone Number <span>*</span></label>
                                                <input type="number" class="form-control" value="{{$candidate->phone}}" name="phone" id="phone">
                                            </div>
                                            @endfieldpermission


                                             @fieldpermission('candidate-create|home_contact')
                                            <div class="col-6">
                                                <label class="form-label">Home Contact <span>*</span></label>
                                                <input type="number" class="form-control validate[required @error('home_contact') is-invalid @enderror]" value="{{ old('home_contact') }}" name="home_contact" id="home_contact">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|gender')
                                            
                                            <div class="col-6">
                                                <label class="form-label">Gender <span>*</span></label>
                                                <select class="form-select validate[required]" aria-label="Default select example" name="gender" id="gender">
                                                    @foreach(config('constant.gender') as $key=>$value)   
                                                   
                                                   <option value="{{$key}}"  @if($candidate->gender==$key) selected  @endif >{{$value}}</option>
                                                  
                                               @endforeach
                                                </select>
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|birth_date')
                                        
                                            <div class="col-6">
                                                <label class="form-label">Birthday<span>*</span></label>
                                                <input type="date" class="form-control validate[required] @error('birthday') is-invalid @enderror" name="birthday" id="birthday" value="{{ $candidate->birth_date }}">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-create|address')
                                            <div class="col-6">
                                                <label class="form-label">Street Address <span>*</span></label>
                                                <input type="text" class="form-control validate[required] @error('address') is-invalid @enderror" placeholder="47-A, city name, United States" name="address" id="address" value="{{ old('address') }}">
                                            </div>
                                            @endfieldpermission

                                            @fieldpermission('candidate-create|state')
                             
                                             <div class="col-6 form-group">
                                              <label class="form-label">State <span>*</span></label>
                                              <select class="form-select mb-3" id="state" name="state" aria-label="Default select example">
                                                <option selected="">Select State</option>
                                                @foreach($states as $state)
                                                <option value="{{$state->id}}">{{$state->name}}</option>
                                                @endforeach
                                              </select>
                                            </div>
                                            @endfieldpermission

                                            @fieldpermission('candidate-create|city')
                                            <div class="col-6 form-group">
                                                <label class="form-label">City <span>*</span></label>
                                                <select class="form-select mb-3" name="city" id="city"aria-label="Default select example">
                                                                
                                                </select>
                                             </div>
                                             @endfieldpermission
                                            @fieldpermission('candidate-create|postal_code')

                                            <div class="col-6">
                                                <label class="form-label">Postal Code <span>*</span></label>
                                                <input type="text" class="form-control validate[required] @error('postal_code') is-invalid @enderror" placeholder="L56 8M0" name="postal_code" id="postal_code" value="{{ old('postal_code') }}">
                                            </div>
                                             @endfieldpermission

                                            @fieldpermission('candidate-create|dd_chq')
                                            <div class="col-6">
                                                <label class="form-label">DD/CHQ</label>
                                                <select class="form-select" name="dd_chq" id="dd_chq" aria-label="Default select example" required>
                                                <option value="">Choose an Option</option>
                                                <option value="1">DD</option>
                                                <option value="2">DD+CHQ</option>
                                                <option value="3">CHQ</option>
                                                <option value="4">OS</option>

                                            </select>
                                            </div>

                                             @endfieldpermission


                                            

                                             @fieldpermission('candidate-create|vaccination')

                                            <div class="col-6">
                                                <label class="form-label" style="display: block;">Vaccination Status</label>
                                                
                                                <input type="radio" class="btn-check" name="vaccination[]" value="vaccinated" id="vaccinated" autocomplete="off">
                                                <label class="btn btn-outline-success" for="vaccinated">Vaccinated</label>

                                                <input type="radio" class="btn-check" name="accination[]" value="not_vaccinated" id="not_vaccinated" autocomplete="off">
                                                <label class="btn btn-outline-success" for="not_vaccinated">Not Vaccinated</label>

                                                
                                            </div>
                                             @endfieldpermission

                                            @fieldpermission('candidate-create|no_call_reasons')
                                            <div class="col-6">
                                                <label class="form-label">Reason for Not Calling</label>
                                                
                                                <textarea  class="form-control" name="no_call_reason" id="no_call_reason" value="{{ old('no_call_reason') }}" placeholder="Unresponsive..."></textarea>
                                            </div>
                                             @endfieldpermission


                                        </div>

                                        <legend style="color:#000; font-weight: 500; margin: 40px 0 0 10px; text-decoration: underline;">Emergency Contact</legend>
                                        <div class="row">


                                         @fieldpermission('candidate-edit|emg_ct_name')
                                            <div class="col-6">
                                                <label class="form-label">Emergency Contact Name</label>
                                                <input type="text" class="form-control" name="emergency_contact_name" id="emergency_contact_name" value="{{$candidate->emg_ct_name }}">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|emg_ct_phone')

                                            <div class="col-6">
                                                <label class="form-label">Emergency Contact Number</label>
                                                <input type="text" class="form-control" name="emergency_contact_phone" id="emergency_contact_phone" value="{{$candidate->emg_ct_phone }}">
                                            </div>
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|emg_ct_rel')

                                            <div class="col-6">
                                                <label class="form-label" for="Relationship">Relationship</label>
                                                <input type="text" class="form-control" name="emergency_contact_rel" id="emergency_contact_rel" value="{{$candidate->emg_ct_rel }}">
                                            </div>
                                            @endfieldpermission


                                        </div>
                                                                                
                                    </fieldset>
                                    <fieldset class="row">
                                        <div class="col-12">
                                            <legend style="display:none;">Job Type</legend>
                                        </div>


                                         @fieldpermission('candidate-edit|job_title_id')
                                        <div class="col-6">
                                            <label class="form-label">Job Title <span>*</span></label>
                                            <select class="form-select validate[required]" name="job_title" id="job_title" aria-label="Default select example" required>
                                                @foreach($job_titles as $job_title)
                                                <option value="{{$job_title->id}}" @if($candidate->job_title_id==$job_title->id) selected="selected" @endif>{{$job_title->title}}</option>
                                               @endforeach
                                            </select>
                                        </div>
                                        @endfieldpermission



                                        <div class="col-6">
                                            <legend style="display:none;">Job Type</legend>
                                        </div>


                                         @fieldpermission('candidate-edit|interest')
                                    
										
										 @php 
                                                    $interested=json_decode($candidate->interest,true);

                                                @endphp 
										
										@if($interested)
                                        <div class="col-12">

                                           


                                            <label class="form-label" style="display: block;">Interested In</label>

                                            <input type="checkbox" class="btn-check" name="interest[]" value="oncall" id="oncall" autocomplete="off" @if(in_array("oncall", $interested)) checked @endif >


                                            <label class="btn btn-outline-success" for="oncall">On Call</label>

                                            <input type="checkbox" class="btn-check" name="interest[]" value="parttime" id="parttime" autocomplete="off"  @if(in_array("parttime", $interested)) checked @endif>

                                            <label class="btn btn-outline-success" for="parttime">Part Time</label>

                                            <input type="checkbox" class="btn-check" name="interest[]" value="fulltime" 
											id="fulltime"  autocomplete="off"  @if(in_array("fulltime", $interested)) checked @endif >
                                            <label class="btn btn-outline-success" for="fulltime">Full Time</label>
                                        </div>
										@endif
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|day_availability')
                                        
										
										
                                            @php 
                                                    $day_available=json_decode($candidate->day_availability,true);

                                                @endphp
												
										@if($day_available)
										<div class="col-12">




                                            <label class="form-label" style="display: block;">Day Availability</label>
                                            
                                            <input type="checkbox" class="btn-check" name="day_availability[]" value="morning" id="morning" autocomplete="off"  @if(in_array("morning", $day_available)) checked @endif>

                                            <label class="btn btn-outline-success" for="morning">Morning</label>

                                            <input type="checkbox" class="btn-check" name="day_availability[]" value="afternoon" id="afternoon" autocomplete="off" @if(in_array("afternoon", $day_available)) checked @endif>

                                            <label class="btn btn-outline-success" for="afternoon">Afternoon</label>

                                            <input type="checkbox" class="btn-check" name="day_availability[]" value="evening" id="evening" autocomplete="off" @if(in_array("evening", $day_available)) checked @endif>

                                            <label class="btn btn-outline-success" for="evening">Evening</label>
                                        </div>
										@endif
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|time_availability')
                                        
										 @php 
                                                    $time_available=json_decode($candidate->time_availability,true);

                                                @endphp
												
										@if($time_available)		
										
										<div class="col-12">

                                           

                                            <label class="form-label" style="display: block;">Time Availability</label>
                                            
                                            <input type="checkbox" class="btn-check" name="time_availability[]" value="weekdays" id="weekdays" autocomplete="off"  @if(in_array("weekdays", $time_available)) checked @endif>

                                            <label class="btn btn-outline-success" for="weekdays">Weekdays</label>

                                            <input type="checkbox" class="btn-check" name="time_availability[]" value="weekends_holidays" id="weekends_holidays" autocomplete="off"  @if(in_array("weekends_holidays", $time_available)) checked @endif>

                                            <label class="btn btn-outline-success" for="weekends_holidays">Weekends/Holidays</label>
                                        </div>
										@endif
                                        @endfieldpermission


                                       
                                    </fieldset>

                                    <fieldset class="row">


                                        <div class="col-12">
                                            <legend style="display:none;">Indentification</legend>
                                        </div>


                                          @fieldpermission('candidate-create|registration_mode')

                                        <div class="col-6">
                                            <label class="form-label">Registered (Online/In-person)</label>
                                            
                                             <select class="form-select" name="registration_mode" id="registration_mode" aria-label="Default select example">
                                                    <option value="">Select Registration Mode</option>
                                                    <option value="1">Online</option>
                                                    <option value="2">Visited</option>
                                                </select>
                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-create|residence_type')
                                        <div class="col-6">

                                            <label class="form-label">Status (Residence Type)</label>
                                           
                                            <select class="form-select" name="residence_type" id="residence_type" aria-label="Default select example">
                                                    <option value="">Select Resident Type</option>
                                                    <option value="1">PR</option>
                                                    <option value="2">Citizen</option>
                                                    <option value="3">Student</option>
                                                    <option value="4">Work Permit</option>
                                                </select>


                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|sin_number')
                                        <div class="col-6">
                                            <label class="form-label">Sin Number</label>
                                            <input type="number" class="form-control" name="sin_number" id="sin_number" value="{{$candidate->sin_number}}">
                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-create|sin_expire')

                                        <div class="col-6">
                                            <label class="form-label">SIN Expire Date</label>
                                            <input type="date" class="form-control @error('sin_expire') is-invalid @enderror" value="{{ old('sin_expire') }}" name="sin_expire" id="sin_expire">
                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|driver_license')
                                        <div class="col-6">
                                            <label class="form-label">Driver License Number</label>
                                            <input type="number" class="form-control" name="driver_license" id="driver_license" value="{{$candidate->driver_license}}">
                                        </div>
                                        @endfieldpermission



                                        @fieldpermission('candidate-create|transportation_mode')
                                        <div class="col-6">
                                                <label class="form-label">Mode of Transportation</label>
                                               
                                                <select class="form-select" name="transportation_mode" id="transportation_mode" aria-label="Default select example">
                                                    <option value="">Select Transportation</option>
                                                    <option value="1">Car</option>
                                                    <option value="2">Bus</option>
                                                    <option value="3">Bike</option>
                                                </select>
                                            </div>

                                        @endfieldpermission



                                        @fieldpermission('candidate-create|languages')

                                        <div class="col-6">
                                            <label class="form-label" style="margin-right: 30px;">Languages</label>
                                            
                                            <input type="checkbox" class="btn-check" name="languages[]" value="english" id="english" autocomplete="off">
                                            <label class="btn btn-outline-success" style="margin-right: 10px;" for="english">English</label>

                                            <input type="checkbox" class="btn-check" name="languages[]" value="hindi" id="hindi" autocomplete="off">
                                            <label class="btn btn-outline-success" for="hindi">Hindi</label>

                                            <input type="checkbox" class="btn-check" name="languages[]" value="punjabi" id="punjabi" autocomplete="off">
                                            <label class="btn btn-outline-success" for="punjabi">Punjabi</label>

                                            <input type="checkbox" class="btn-check" name="languages[]" value="other" id="other" autocomplete="off">
                                            <label class="btn btn-outline-success" for="other">Others</label>
                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|own_car')
                                        <div class="col-6">

                                            

                                            <label class="form-label" style="margin-right: 30px;">Have Your Own Car</label>
                                            
                                            <input type="radio" class="btn-check" name="own_car" id="yes" value="yes" autocomplete="off" @if($candidate->own_car=='yes')? checked : '' @endif>
                                            <label class="btn btn-outline-success" style="margin-right: 10px;" for="yes">Yes</label>

                                            <input type="radio" class="btn-check" name="own_car" id="no" value="no" autocomplete="off" @if($candidate->own_car=='no')? checked : '' @endif>
                                            <label class="btn btn-outline-success" for="no">No</label>
                                        </div>
                                        @endfieldpermission



                                        @fieldpermission('candidate-create|internal_notes')
                                        <div class="col-6">
                                            <label class="form-label">Internal Notes</label>
                                            <input type="text" class="form-control @error('internal_notes') is-invalid @enderror" value="{{$candidate->internal_notes}}" name="internal_notes" id="internal_notes">
                                        </div>
                                        @endfieldpermission

                                        @fieldpermission('candidate-create|notes')
                                        <div class="col-6">
                                            <label class="form-label">Notes</label>
                                            <input type="text" class="form-control @error('notes') is-invalid @enderror" value="{{$candidate->notes}}" name="notes" id="notes">
                                        </div>
                                        @endfieldpermission

                                    </fieldset>


                                    <fieldset class="row ">


                                        <div class="col-12">

                                            <legend style="display:none;">Education History</legend>
                                        </div>
                                        <div class="input-row row">


                                         @fieldpermission('candidate-edit|education_history')
                                            
											 @php 
                                                    $edu_history=json_decode($candidate->education_history,true);

                                                @endphp 
												
												
											@if($edu_history)
											
											<div class="col-3">


                                               


                                                <label class="form-label">Level Education <span>*</span></label>
                                               
                                                <select class="form-select" name="education[]" id="education" aria-label="Default select example">
                                                    

                                                    @foreach($job_educations as $job_education)
                                                    <option value="{{$job_education->id}}" @if($job_education->id==$edu_history[0]['education']) selected @endif>{{$job_education->title}}</option>
                                                   @endforeach
                                                    
                                                </select>
                                            </div>
											@endif
											
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|education_history')
                                           
										   @if($edu_history)
										   <div class="col-3">
                                                <label class="form-label">Course Studied</label>
                                                
                                               <select class="form-select validate[required]" name="course[]" id="course" aria-label="Default select example">
                                                   
                                                    @foreach($job_courses as $job_course)
                                                    <option value="{{$job_course->id}}" @if($job_course->id==$edu_history[0]['course']) selected @endif >{{$job_course->title}}</option>
                                                   @endforeach
                                                </select>
                                            </div>
											@endif
											
											
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|education_history')
                                            
											
											@if($edu_history)
											<div class="col-3">
                                                <label class="form-label">Certification</label>
                                               
                                                <select class="form-select validate[required]" name="certificate[]" id="certificate" aria-label="Default select example">
                                                    @foreach($job_certificates as $job_certificate)
                                                    <option value="{{$job_certificate->id}}" @if($job_certificate->id==$edu_history[0]['certificate']) selected @endif >{{$job_certificate->title}}</option>
                                                   @endforeach
                                                </select>
                                            </div>
											@endif
											
                                            @endfieldpermission
											

                                            <div class="col-3 pt-29" align="right">
                                                <button type="button" class="remove-row" style="margin-top:34px;" >X</button>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="ms-auto">
                                                <div class="btn-group">
                                                    <a id="add-new" class="btn btn-success" onclick="add()"> <b>+</b> Add </a>
                                                </div>
                                            </div>
                                        </div>
										
										
                                    </fieldset>
									 
									
                                    <fieldset class="row">
                                        <div class="col-12">
                                            <legend style="display:none;">Employement History</legend>
                                        </div>
                                        <div class="input-row-em row">


                                         @fieldpermission('candidate-edit|employment_history')
                                            
											
                                            	@php 
                                                    $emp_history=json_decode($candidate->employment_history,true);

                                                @endphp 
	
											@if($emp_history)
											<div class="col-3">

												
   
	



                                                <label class="form-label">Company Name <span>*</span></label>
                                                <input type="text" class="form-control" name="old_company[]" id="old_company" value="{{$emp_history[0]['old_company']}}">
                                            </div>
											@endif
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|employment_history')
                                            
											@if($emp_history)
											<div class="col-3">
                                                <label class="form-label">Job Title</label>
                                           <select class="form-select validate[required]" name="old_job_title" id="old_job_title" aria-label="Default select example" required>
                                               
                                                @foreach($job_titles as $job_title)
                                                <option value="{{$job_title->id}}" @if($job_title->id==$emp_history[0]['old_job_title']) selected @endif>{{$job_title->title}}</option>
                                               @endforeach
                                            </select>
                                            </div>
											
											@endif
                                            @endfieldpermission


                                         @fieldpermission('candidate-edit|employment_history')
                                            
											@if($emp_history)
											<div class="col-3">
                                                <label class="form-label">Job Type</label>
                                                <select class="form-select validate[required]" name="old_job_type[]" id="old_job_type" aria-label="Default select example">
                                                @foreach($job_types as $job_type)
                                                <option value="{{$job_type->id}}" @if($job_type->id==$emp_history[0]['old_job_type']) selected @endif>{{$job_type->title}}</option>
                                               @endforeach
                                            </select>
                                            </div>
											@endif
                                            @endfieldpermission


                                            <div class="col-3 pt-29" align="right">
                                                <button type="button" class="remove-row-em" style="margin-top:34px;" >X</button>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="ms-auto">
                                                <div class="btn-group">
                                                    <a id="add-new-em" class="btn btn-success" onclick="addEm()"><b>+</b> Add </a>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row">
                                        <div class="col-12">
                                            <legend style="display:none;">Banking Information</legend>
                                        </div>


                                         @fieldpermission('candidate-edit|bank_name')
                                        <div class="col-6">
                                            <label class="form-label">Bank Name <span>*</span></label>
                                            <input type="text" class="form-control" name="bank_name" id="bank_name" value="{{$candidate->bank_name}}">
                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|account_number')
                                        <div class="col-6">
                                            <label class="form-label">Account Number <span>*</span></label>
                                            <input type="number" class="form-control" name="account_number" id="account_number" value="{{$candidate->account_number}}">
                                        </div>
                                        @endfieldpermission


                                         @fieldpermission('candidate-edit|ifsc_code')
                                        <div class="col-6">
                                            <label class="form-label">Routing Number <span>*</span></label>
                                            <input type="text" class="form-control" name="ifsc_code" id="ifsc_code" value="{{$candidate->ifsc_code}}">
                                        </div>
                                        @endfieldpermission


                                    </fieldset>
                                    <p>

                                       
                                        <button id="SaveAccount" type="submit" class="btn btn-success px-4">Update Candidate</button>

                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





<script type="text/javascript">

 function add(){
    let newel = $('.input-row:last').clone(true);
    $(newel).insertAfter(".input-row:last");
 }

 function addEm(){
    let newel = $('.input-row-em:last').clone(true);
    $(newel).insertAfter(".input-row-em:last");
 }


$('.remove-row').click(function(){
    $(this).closest(".input-row").remove();
});

$('.remove-row-em').click(function(){
    $(this).closest(".input-row-em").remove();
});
    



</script>
<script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('.profile > img').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#add-pencil-icon").change(function() {
            readURL(this);
        });
    </script>
     <style type="text/css">
        .store-logo.profile {
            position: relative;
        }


 .box-for-image .store-logo.profile {
    height: 110px;
    width: 110px;
    overflow-y: hidden;
}

 .box-for-image input[type="text"] {
    background: #fff;
    margin-bottom: 0;
}

 .box-for-image .form-field-here {
    position: relative;
    margin-top: 0;
}

        
        .form-field-here input.edit-manufacture-icon {
            position: absolute;
            height: 30px;
            width: 30px;
            border-radius: 50%;
            bottom: 5px;
            left: 5px;
            cursor: pointer;
        }
        
        .form-field-here input.edit-manufacture-icon:focus {
            outline: none;
        }
        
        .form-field-here input.edit-manufacture-icon:before {
            content: "";
            background: green;
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
        }
        
        .form-field-here input.edit-manufacture-icon:after {
            content: "\f040";
            font-family: FontAwesome;
            color: #fff;
            top: 0;
            left: 0;
            position: absolute;
            line-height: 30px;
            text-align: center;
            width: 100%;
        }

.form-field-here input.btn-pencil-icon {
    position: absolute;
    height: 30px;
    width: 30px;
    border-radius: 50%;
    bottom: 5px;
    left: 5px;
    cursor: pointer;
}

.form-field-here input.btn-pencil-icon:before {
    content: "";
    background: green;
    position: absolute;
    height: 100%;
    width: 100%;
    top: 0;
}

.form-field-here input.btn-pencil-icon:after {
    content: "\f4cb";
    font-family: 'bootstrap-icons';
    color: #fff;
    top: 0;
    left: 0;
    position: absolute;
    line-height: 30px;
    text-align: center;
    width: 100%;
}
input:focus {
    outline: none !important;
}
.box-for-image.main-image {
    position: relative;
}
.form-field-here.add-product-image label.input-label {
    position: static;
    margin-bottom: 5px;
}

.form-field-here.add-product-image input.btn-pencil-icon {
    padding: 0;
    margin: 0;
}
.box-for-image .store-logo.profile img {
    width: 100%;    
}

.filter-blocks.multi-fields-set .input-filter.col-sm-2 {
    padding-right: 0;
}

    </style>  

<!-- <script>
$(document).ready(function() {
    $('#SignupForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            first_name: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required and cannot be empty'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'The content must be more than 3 less than 30 characters long'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not valid'
                    }
                }
            },
            phone: {
                validators: {
                    notEmpty: {
                        message: 'The title is required and cannot be empty'
                    },
                    stringLength: {
                        max: 10,
                        message: 'The title must be 10 characters long'
                    }
                }
            },
            content: {
                validators: {
                    notEmpty: {
                        message: 'The content is required and cannot be empty'
                    },
                    stringLength: {
                        max: 500,
                        message: 'The content must be less than 500 characters long'
                    }
                }
            }
        },
    });
});
</script> -->


@endsection
