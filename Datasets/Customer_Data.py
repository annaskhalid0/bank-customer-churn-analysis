import pandas as pd
import random
from faker import Faker

fake = Faker()

def generate_bank_customers(n=10000):
    data = []
    for _ in range(n):
        age = random.randint(18, 70)
        gender = random.choice(['Male', 'Female'])
        region = random.choice(['Dubai', 'Abu Dhabi', 'Sharjah', 'Ajman', 'RAK','Fujairah','Umm AL-Quwain'])
        income = random.randint(3000, 25000)
        account_balance = random.randint(0, 200000)
        products = random.randint(1, 4)
        credit_score = random.randint(300, 850)
        has_credit_card = random.choice(['NO', 'YES'])
        is_active = random.choice(['NO', 'YES'])
        tenure_years = random.randint(1, 10)
        churned = random.choices(['NO', 'YES'], weights=[85, 15])[0]  # 15% churn rate

        data.append({
            'Customer_ID': fake.uuid4(),
            'Name': fake.name(),
            'Gender': gender,
            'Age': age,
            'Region': region,
            'Income': income,
            'Account_Balance': account_balance,
            'Products_Held': products,
            'Credit_Score': credit_score,
            'Has_Credit_Card': has_credit_card,
            'Is_Active_Member': is_active,
            'Tenure_Years': tenure_years,
            'Churned': churned
        })

    return pd.DataFrame(data)

# Generate and export
df = generate_bank_customers()
df.to_csv("bank_customer_churn.csv", index=False)
print("Dataset created: bank_customer_churn.csv")
