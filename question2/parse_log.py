import json
import re
import os

log_file = '/tmp/timestamp.log'
output_file = 'question2/errors.json'

pattern = r'^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3}) - ERROR - (.+)$'
errors = []

with open(log_file, 'r') as file:
    for line in file:
        match = re.match(pattern, line)
        if match:
            timestamp, message = match.groups()
            errors.append({
                "timestamp": timestamp,
                "error_message": message.strip()
            })

# Create output folder if it doesn't exist
os.makedirs(os.path.dirname(output_file), exist_ok=True)

# Write JSON file
with open(output_file, 'w') as out:
    json.dump(errors, out, indent=4)

print(f"Extracted {len(errors)} error messages into {output_file}")
