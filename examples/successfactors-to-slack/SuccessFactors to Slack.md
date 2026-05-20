# SAP SuccessFactors Employee Central to Slack

This example demonstrates how to monitor SAP SuccessFactors Employee Central for newly onboarded employees and
automatically send a welcome notification to a Slack channel using the
`sap.successfactors.ecemploymentinformation` connector.

## Overview

When new employees start at an organization, HR and team leads often need to be notified quickly. This integration
polls SAP SuccessFactors Employee Central on a configurable schedule, detects employees with a start date on or after
the last poll, and posts a welcome message to a designated Slack channel.

## Prerequisites

### 1. Setup the SAP SuccessFactors API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials
(hostname, username, password).

### 2. Setup Slack

1. Create a Slack app at https://api.slack.com/apps.
2. Add the `chat:write` and `channels:read` OAuth scopes.
3. Install the app to your workspace and copy the **Bot User OAuth Token**.
4. Invite the bot to the target channel (e.g., `#hr-announcements`).

Refer to the [Slack connector guide](https://central.ballerina.io/ballerinax/slack/latest) for detailed setup
instructions.

### 3. Configuration

Configure credentials in `Config.toml` in the example directory:

```toml
slackChannel = "#hr-announcements"
pollIntervalSeconds = 3600

[sfClientConfig]
hostname = "<SuccessFactors_Hostname>"
username = "<SF_Username>"
password = "<SF_Password>"

[slackClientConfig]
token = "<Slack_Bot_Token>"
```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```

The program polls SuccessFactors immediately on startup and then again every `pollIntervalSeconds` (default: 1 hour).

## Testing

1. Add a new employee record in SAP SuccessFactors with today's start date.
2. Run the example (or wait for the next poll cycle).
3. Verify that a welcome message appears in your configured Slack channel.
