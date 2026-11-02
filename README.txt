CYBERSECURITY LOG ANALYSIS USING LINUX TOOLS

1. Project Description

This project analyses a simulated Linux SSH authentication log to identify repeated failed login attempts and potentially suspicious IP addresses.

2. Files Included

- auth.log: Simulated SSH authentication log.
- analyze.sh: Bash script used to analyse the log.
- cleaned.log: Generated output containing normalized log entries.
- README.txt: Project description and execution instructions.

3. Tools Used

- Bash
- grep
- sed
- awk
- sort
- uniq

4. Execution Instructions

Step 1: Open the terminal in the project directory.

Step 2: Give execution permission to the script:

chmod +x analyze.sh

Step 3: Execute the script:

./analyze.sh

Step 4: View the generated log:

cat cleaned.log

5. Dataset Source

The log file was created manually using simulated SSH authentication records for educational purposes. No external dataset was downloaded, and no real system was targeted.

6. Expected Result

The script counts failed and successful login attempts, groups failed attempts by IP address, and flags IP addresses with three or more failed attempts for further investigation.
