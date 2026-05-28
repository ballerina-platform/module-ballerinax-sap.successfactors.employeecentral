# SAP SuccessFactors Employee Central to Slack

This example demonstrates how to fetch recently onboarded employees from SAP SuccessFactors Employee Central and
send a welcome notification to a Slack channel via an incoming webhook using the
`sap.successfactors.ecemploymentinformation` connector.

## Overview

When new employees start at an organization, HR and team leads often need to be notified quickly. This program
queries SAP SuccessFactors for employees whose start date falls within the last `lookbackDays` days and posts a
welcome message to a Slack channel for each one. It runs as a one-shot script and exits after sending notifications.

## Prerequisites

### 1. Setup the SAP SuccessFactors API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials
(hostname, username, password).

### 2. Setup Slack Incoming Webhook

1. Go to https://api.slack.com/apps and create a Slack app.
2. Under **Incoming Webhooks**, enable webhooks and add one to your target channel (e.g. `#hr-announcements`).
3. Copy the webhook URL.

### 3. Configuration

Configure credentials in `Config.toml` in the example directory:

```toml
slackWebhookUrl = "https://hooks.slack.com/services/<your-webhook-path>"
lookbackDays = 7

[sfClientConfig]
hostname = "<SuccessFactors_Hostname>"
username = "<SF_Username>"
password = "<SF_Password>"
```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```

The program fetches employees with a start date within the last `lookbackDays` days, sends a Slack message for each,
and exits.

## Testing

1. Add a new employee record in SAP SuccessFactors with a start date within the last `lookbackDays` days.
2. Run the example.
3. Verify that a welcome message appears in your configured Slack channel.
