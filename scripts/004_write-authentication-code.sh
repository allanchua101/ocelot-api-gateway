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