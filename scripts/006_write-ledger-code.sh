# Write code for ledger API
mkdir ./Ledger/Models

cat > ./Ledger/Models/Transaction.cs <<EOL
using System;

namespace Ledger.Models
{
    public class Transaction
    {
        public Guid ProductID { get; set; }

        public Guid UserID { get; set; }

        public double PriceAtPointInTime { get; set; }

        public DateTime OccuredAt { get; set; }

        public double Quantity { get; set; }

        public double Total { get; set; }
    }
}
EOL