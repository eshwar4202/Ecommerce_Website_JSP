<style>
	#sea{
		position: relative;
		left: -400px;
	}
	#right{
		position: relative;
		left :800px;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-info">
<div class = "container">
  <a class="navbar-brand" href="#">E-commerce website</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa fa-home"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item" id = "right">
        <a class="nav-link" href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a>  <span class="badge badge-danger">${cart_list.size()}</span> </li>
        
      
      <%if (auth != null) {
				%>
				<li class="nav-item" id = "right"><a class="nav-link" href="orders.jsp">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item" id = "right"><a href="https://www.flaticon.com/free-icons/user" title="user icons"></a><a class="nav-link" href="login.jsp">Login</a></li>
				<li class="nav-item" id = "right"><a class="nav-link" href="signup.jsp">SignUp</a></li>
				<%
				}
				%>
		
    </ul>
    

   
  </div>
 </div>
 
 <form action = "filter" method = "post">
  		<div class="input-group rounded" id="sea">
  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" name = "filter-value" size=200 />
  <span class="input-group-text border-0" id="search-addon">
    <button type = "submit" style="font-size:24px"><i class="fa fa-search"></i></button>
 </span>
</div>
      </form>
      <form action="remove-filter">
      	<button type="Submit" class="btn btn-warning">Remove</button>
      </form>
</nav>