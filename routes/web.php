<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\JobsController; 
use App\Http\Controllers\AgencyController;
use App\Http\Controllers\AjaxController;
use App\Http\Controllers\BankController;
use App\Http\Controllers\CallCenterController;
use App\Http\Controllers\CandidateController;
use App\Http\Controllers\CmsController;
use App\Http\Controllers\CompanyController; 
use App\Http\Controllers\CronController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\EducationController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\ExportController;
use App\Http\Controllers\GoogleMapController; 
use App\Http\Controllers\ImportController;
use App\Http\Controllers\InterviewController;
use App\Http\Controllers\JobCategoryController;
use App\Http\Controllers\JobIndustryController;
use App\Http\Controllers\JobPositionController;
use App\Http\Controllers\JobTitleController; 
use App\Http\Controllers\JobTypeController;
use App\Http\Controllers\JobExperienceController;
use App\Http\Controllers\JobEducationController;
use App\Http\Controllers\JobCourseController;
use App\Http\Controllers\JobCertificateController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\NotificationController; 
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PayrollController;
use App\Http\Controllers\PdfController;
use App\Http\Controllers\PlanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ResumeController; 
use App\Http\Controllers\SearchController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\StatusController;
use App\Http\Controllers\SubRoleController;
use App\Http\Controllers\TaxController;
use App\Http\Controllers\TeamController; 


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::any('/', function () {
    return view('welcome');
});

Auth::routes();
  Route::any('dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // candidate auth
   Route::any('candidate/login', [CandidateController::class, 'candidateLogin'])->name('candidate.login');
   Route::any('candidate/signup', [CandidateController::class, 'candidateSignup'])->name('candidate.signup');
   Route::any('candidate/dashboard', [CandidateController::class, 'candidateDashboard'])->name('candidate.dashboard');    

   // agency auth
   Route::any('agency/login', [AgencyController::class, 'agencyLogin'])->name('agency.login');
   Route::any('agency/signup', [AgencyController::class, 'agencySignup'])->name('agency.signup');
   Route::any('agency/dashboard', [AgencyController::class, 'agencyDashboard'])->name('agency.dashboard');    

   // company auth
   Route::any('company/login', [CompanyController::class, 'companyLogin'])->name('company.login');
   Route::any('company/signup', [CompanyController::class, 'companySignup'])->name('company.signup');
   Route::any('company/dashboard', [CompanyController::class, 'companyDashboard'])->name('company.dashboard');

Route::group(['middleware' => ['auth']], function() {

   Route::resource('permissions', PermissionController::class);
   Route::resource('roles', RoleController::class);
   //user
   Route::any('users', [UserController::class, 'index'])->name('users.index');
   Route::any('users/create', [UserController::class, 'create'])->name('users.create');
   Route::any('users/edit/{id}', [UserController::class, 'edit'])->name('users.edit');
   Route::any('users/update/{id}', [UserController::class, 'update'])->name('users.update');
   Route::any('users/show', [UserController::class, 'show'])->name('users.show');
   Route::any('users/store', [UserController::class, 'store'])->name('users.store');
   Route::any('user/status', [AjaxController::class, 'updateUserStatus'])->name('user.status');
	
   
});   




