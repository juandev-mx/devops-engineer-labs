# Application Instrumentation

## OverView

In this lab, a Python Flask application was instrumented using the Prometheus Python Client library to expose custom metrics. The application was configured to publish metrics through an HTTP endpoint, allowing Prometheus to collect and monitor application-level performance and operational data.

The lab demonstrates how to create and expose custom metrics such as request counters, error counters, and gauges, and how to integrate an instrumented application with Prometheus monitoring.

---

## Objectives

* Instrument a Python application using the Prometheus Client Library.
* Create custom Prometheus metrics.
* Expose metrics through an HTTP endpoint.
* Configure Prometheus to scrape application metrics.
* Validate metric collection through Prometheus Targets and Metrics endpoints.

---

## Technologies Used

* Prometheus
* Prometheus Python Client
* Python 3.8
* Flask
* Linux
* Node Exporter

---

## Repository Structure

```text
prometheus-application-instrumentation/
├── README.md
├── manifests/
│   ├── main.py
│   └── prometheus.yml
├── outputs/
│   └── application-instrumentation.txt
└── screenshot/
    └── .gitkeep
```

---

## Application Instrumentation

The application was developed using Flask and instrumented with the Prometheus Python Client.

### Custom Metrics Implemented

#### Request Counter

Tracks the total number of HTTP requests handled by the application.

```python
REQUESTS = Counter(
    'http_requests_total',
    'Total number of requests'
)
```

---

#### Error Counter

Tracks HTTP errors using labels.

```python
ERRORS = Counter(
    'http_errors_total',
    'Total number of errors',
    labelnames=['code']
)
```

---

#### In-Progress Requests Gauge

Tracks active requests being processed.

```python
IN_PROGRESS = Gauge(
    'inprogress_requests',
    'Total number of requests in progress'
)
```

---

## Application Endpoints

### Products

```http
GET /products
POST /products
```

### Cart

```http
GET /cart
POST /cart
```

### Error Handling

```http
404 Not Found
```

Errors are counted through the custom metric:

```python
ERRORS.labels('404').inc()
```

---

## Metrics Endpoint

The Prometheus metrics server was exposed on port **8000**.

```python
start_http_server(8000)
```

The Flask application was executed on port **6000**.

```python
app.run(
    debug=False,
    host="0.0.0.0",
    port="6000"
)
```

Metrics became available at:

```text
http://localhost:8000/metrics
```

---

## Prometheus Configuration

Prometheus was configured to scrape the application metrics endpoint.

### Job Configuration

```yaml
- job_name: "api"
  static_configs:
    - targets:
        - localhost:8000
```

---

## Validation

### Verify Metrics Endpoint

```bash
curl http://localhost:8000/metrics
```

Example output:

```text
# HELP http_requests_total Total number of requests
# TYPE http_requests_total counter

# HELP http_errors_total Total number of errors
# TYPE http_errors_total counter

# HELP inprogress_requests Total number of requests in progress
# TYPE inprogress_requests gauge
```

---

### Verify Prometheus Targets

```bash
curl http://localhost:9090/api/v1/targets
```

Observed target:

```json
{
  "instance": "localhost:8000",
  "job": "api",
  "health": "up"
}
```

The target status confirmed that Prometheus was successfully scraping metrics from the application.

---

## Evidence Collected

The following artifacts were collected during the lab:

### Configuration

* Prometheus configuration file
* Application source code

### Validation

* Prometheus Targets API output
* Metrics endpoint output
* Running application process verification

### Outputs

Stored in:

```text
outputs/application-instrumentation.txt
```

---

## Key Concepts Learned

* Application instrumentation with Prometheus.
* Creating custom counters and gauges.
* Exposing metrics through an HTTP endpoint.
* Monitoring Flask applications with Prometheus.
* Prometheus scrape configuration.
* Metrics validation and troubleshooting.
* Observability fundamentals for backend services.

---

## Result

A Flask application was successfully instrumented with Prometheus metrics, exposing operational and business-related telemetry data through a dedicated metrics endpoint. Prometheus was configured to scrape the application, validating successful integration through the Prometheus Targets API and metrics endpoint verification.
