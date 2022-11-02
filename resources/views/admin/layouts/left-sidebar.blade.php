   <aside class="sidebar-wrapper" data-simplebar="true">
          <div class="sidebar-header">
            <div>
              <img src="{{asset('assets/images/logo-icon.png')}}" class="logo-icon" alt="logo icon">
            </div>
            <div>
              <h4 class="logo-text">Jobs Admin</h4>
            </div>
            <div class="toggle-icon ms-auto"> <i class="bi bi-list"></i>
            </div>
          </div>
          <!--navigation-->
        <ul class="metismenu" id="menu">
            <li>
              <a href="{{route('dashboard')}}">
                <div class="parent-icon"><i class="bi bi-house-fill"></i>
                </div>
                <div class="menu-title">Dashboard</div>
              </a>              
            </li>
            <li>
      
            
			 
			@role('admin') 
  			 <li>
              <a href="#" class="has-arrow">
                <div class="parent-icon"><i class="bi bi-person-lines-fill"></i>
                </div>
                <div class="menu-title">Manage Users</div>
              </a>
              <ul>
                <li>
                      <a href="{{route('users.index')}}"><i class="fa fa-list-ul"></i>Users List</a>
                  </li>
                  <li>
                      <a href="{{route('users.create')}}"><i class="fa fa-plus"></i>Add User</a>
                  </li>
              </ul>
            </li>

                 <li>
              <a href="#" class="has-arrow">
                <div class="parent-icon"><i class="bi bi-person-lines-fill"></i>
                </div>
                <div class="menu-title">Manage Role</div>
              </a>
              <ul>
                <li>
                      <a href="{{route('roles.index')}}"><i class="fa fa-list-ul"></i>Role List</a>
                  </li>
                  <li>
                      <a href="{{route('roles.create')}}"><i class="fa fa-plus"></i>Role User</a>
                  </li>
              </ul>
            </li>

  
			 
			 @endrole
			 
			 

			 
			 
			<li>
			
              <a href="{{ route('logout') }}">
                <div class="parent-icon"><i class="bi bi-lock-fill"></i>
                </div>
                <div class="menu-title">Logout</div>
              </a>
            </li>

            <!-- <li class="menu-label">UI Elements</li> -->
           
          </ul>
          <!--end navigation-->
       </aside>