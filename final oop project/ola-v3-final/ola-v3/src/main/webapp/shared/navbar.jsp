<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <!-- Brand -->
        <a class="navbar-brand d-flex align-items-center" href="../index.jsp">
            <i class="fas fa-car-side me-2"></i> <!-- Car Icon -->
            OLA Premium
        </a>
        
        <!-- Toggler Button for Mobile View -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Collapsible Navbar -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <!-- Dashboard Link -->
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/user/dash_board.jsp">
                        <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                    </a>
                </li>
                
                
                <!-- Logout Button -->
                <li class="nav-item">
                    <form action="<%=request.getContextPath()%>/UserController?action=logout" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="logout">
                        <button type="submit" class="nav-link btn btn-link"">
                            <i class="fas fa-sign-out-alt me-1"></i> Logout
                        </button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Ensure you include FontAwesome or Bootstrap Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
