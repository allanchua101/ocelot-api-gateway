# Write code for authentication API
mkdir ./Authentication/Models

cat > ./Authentication/Models/User.cs <<EOL
using System;

namespace Authentication.Models
{
    public class User
    {
        public Guid UserId { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }
    }
}
EOL

cat > ./Authentication/Controllers/UserController.cs <<EOL
using Authentication.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace Authentication.Controllers
{
    [Route("api/[controller]")]
    public class UserController : Controller
    {
        [HttpGet]
        public List<User> All()
        {
            return new List<User>()
            {
                new User() {FirstName = "Allan", LastName = "Chua", UserId = Guid.Parse("539bf338-e5de-4fc4-ac65-4a91324d8111")},
                new User() {FirstName = "Burr", LastName = "Sutter", UserId = Guid.Parse("6b2c4788-e1d5-4ef4-8edf-e7d57e31bf4f")},
                new User() {FirstName = "Josh", LastName = "Long", UserId = Guid.Parse("3a4149fa-32e9-4d4a-a051-5c49b7ed2fca")}
            };
        }
    }
}
EOL

mkdir ./Authentication/Properties

cat > ./Authentication/Properties/launchSettings.json <<EOL
{
  "iisSettings": {
    "windowsAuthentication": false,
    "anonymousAuthentication": true,
    "iisExpress": {
      "applicationUrl": "http://localhost:52792/",
      "sslPort": 0
    }
  },
  "profiles": {
    "IIS Express": {
      "commandName": "IISExpress",
      "launchBrowser": true,
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    },
    "Ledger": {
      "commandName": "Project",
      "launchBrowser": true,
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      },
      "applicationUrl": "http://localhost:52792/"
    }
  }
}
EOL

cat > ./Authentication/wwwroot/index.html <<EOL
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i');
  
body, html {
    height: 100%;
    margin: 0;
    background-color: #00BFFF;
    text-align: center;
}
h1 {
 color: white;
 font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
<h1>Authentication Service</h1>
</body>
</html>
EOL

cat > ./Authentication/Startup.cs <<EOL
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;

namespace Authentication
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseDefaultFiles(new DefaultFilesOptions
            {
                DefaultFileNames = new List<string> { "index.html" }
            });
            app.UseMvc();
            app.UseStaticFiles();
        }
    }
}
EOL