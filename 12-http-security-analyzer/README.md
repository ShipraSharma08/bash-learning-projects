# HTTP Security Analyzer

A Bash-based web security analysis tool that performs basic HTTP/HTTPS security checks on a user-provided website URL.

## Features

- HTTPS usage detection
- HTTP status code detection
- Server information detection
- HTTP redirect detection
- Security header analysis
- Security header presence/missing summary
- DNS and network error handling
- Direct executable support
- Clean terminal-based security report

## Security Checks

The analyzer checks the following HTTP security headers:

- Strict-Transport-Security
- Content-Security-Policy
- X-Content-Type-Options
- X-Frame-Options

For each header, the tool reports whether it is present or missing.

## Example Analysis

    ===== HTTP Security Analyzer =====

    Target: https://example.com

    HTTP Security Analysis Started...

    HTTPS Security Check:
    HTTPS: ENABLED

    HTTP Status Code:
    200

    Server Information:
    Server: cloudflare

    Redirect Detection:
    No redirect detected.

    Security Headers:
    [MISSING] Strict-Transport-Security
    [MISSING] Content-Security-Policy
    [MISSING] X-Content-Type-Options
    [MISSING] X-Frame-Options

    Security Header Summary:
    Present: 0
    Missing: 4
    Total Checked: 4

    ==================================
    HTTP security analysis completed.

## Technologies Used

- Bash
- Linux
- curl
- HTTP/HTTPS
- HTTP Security Headers
- DNS
- Basic Web Security Concepts

## Commands and Concepts

### curl

The project uses curl to communicate with HTTP/HTTPS servers and inspect HTTP responses.

### HTTP Status Codes

The analyzer extracts the HTTP response status code returned by the target.

Examples:

- 200 — successful response
- 301 — permanent redirect
- 302 — temporary redirect
- 404 — resource not found
- 500 — server-side error

### HTTPS Detection

The analyzer checks whether the supplied URL uses the HTTPS scheme.

HTTPS provides encrypted communication between the client and web server.

### Server Information

The tool checks the Server response header when available.

Server information may reveal software or infrastructure details. The absence of a Server header does not automatically mean the server is secure.

### Redirect Detection

The analyzer checks for the HTTP Location header to identify redirects.

A redirect is not automatically a security vulnerability. Its security relevance depends on the destination and context.

### Security Headers

The analyzer checks four common security-related HTTP headers.

#### Strict-Transport-Security

Helps browsers enforce HTTPS connections for a domain.

#### Content-Security-Policy

Allows a website to define restrictions on the types and sources of content that browsers can load.

#### X-Content-Type-Options

Helps prevent MIME-type sniffing when configured with nosniff.

#### X-Frame-Options

Controls whether a page can be loaded inside a frame, helping mitigate certain clickjacking scenarios.

## Error Handling

The tool handles connection and DNS failures without crashing.

Example:

    curl: (6) Could not resolve host
    Unable to connect to the target.
    Please check the URL, DNS, or network connection.

## How to Run

Make the script executable:

    chmod +x http_security_analyzer.sh

Run the analyzer:

    ./http_security_analyzer.sh

Enter a website URL when prompted:

    https://example.com

## Project Structure

    12-http-security-analyzer/
    ├── http_security_analyzer.sh
    └── README.md

## Security and Ethical Use

This tool is intended for defensive security learning, web-security analysis, and authorized testing.

Only analyze websites and systems for which you have permission to perform security testing.

Do not use the tool against systems without authorization.

## Learning Outcomes

Through this project, the following concepts were practiced:

- Bash scripting
- Conditional statements
- Arrays
- Loops
- Command substitution
- curl
- HTTP/HTTPS
- HTTP response headers
- DNS error handling
- Basic web security analysis
- Security header analysis
- Linux executable permissions
- Security-oriented automation

## Future Improvements

Possible future enhancements include:

- TLS certificate information
- Certificate expiration detection
- More security headers
- HTTP-to-HTTPS redirect analysis
- Cookie security analysis
- Response-time measurement
- Security scoring/report generation
- Colored terminal output
- Automated report export
