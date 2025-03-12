import streamlit as st
import mysql.connector
import pandas as pd

# Database Connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Yazh@2003#",
    database="clinical_trial_mystery"
)
cursor = conn.cursor()

# Display title and introduction
st.title("SQL Mystery Challenge: Missing Drug Report")
st.write("Investigate the data, solve the clues, and uncover the mystery!")

# Display List of Tables in Database
st.markdown("## List of Tables in Database")
try:
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()
    table_list = [table[0] for table in tables]
    st.write(", ".join(table_list))  # Display tables in a clean format
except Exception as e:
    st.error(f"Error fetching table list: {e}")

# Custom SQL Query Section
custom_query = st.text_area("Enter your SQL query here:")
if st.button("Run Query"):
    try:
        cursor.execute(custom_query)
        result = cursor.fetchall()

        if result and cursor.description:
            columns = [desc[0] for desc in cursor.description]
            df = pd.DataFrame(result, columns=columns)
            st.dataframe(df)

            # Correct Answer Logic
            correct_answer_query = """
                SELECT r.report_id, r.phase, r.status, r.location, s.name 
                FROM reports r
                JOIN staff s ON r.location = 'Unknown'
                WHERE r.phase = 4 AND s.department = 'Data Science';
            """
            cursor.execute(correct_answer_query)
            correct_answer = cursor.fetchall()

            if sorted(result) == sorted(correct_answer):
                st.success("🎯 Correct Answer! You've solved the mystery!")
                st.balloons()  # 🎈 Celebratory animation for completing the challenge
                st.markdown("### 🏆 **Challenge Completed! Well Done!**")
            else:
                st.warning("❌ Incorrect Answer! Try again.")
        else:
            st.warning("⚠️ No data found. Please revise your query.")
    except Exception as e:
        st.error(f"Error: {e}")

# Hint System
st.markdown("## Need a Hint?")
hints = st.radio("Select a hint step:", ["Step 1", "Step 2", "Step 3", "Final Hint"])

hint_messages = {
    "Step 1": "Start by exploring the 'reports' table for missing entries in Phase 4.",
    "Step 2": "Check for researchers involved in 'Data Science'.",
    "Step 3": "Look for patients with a high drug response but marked 'Dropped Out'.",
    "Final Hint": "The missing report is linked to a researcher from the Data Science department who accessed Phase 4 reports."
}

if hints in hint_messages:
    st.info(hint_messages[hints]) if hints != "Final Hint" else st.success(hint_messages[hints])
