PerishTrack: Smart Inventory Management System for Perishable Goods
===================================================================

Overview
--------

PerishTrack is a comprehensive inventory management system tailored for businesses handling perishable goods. It streamlines the tracking of stock levels, expiration dates, and supplier information. The system automatically reorders low stock, manages expired items, and logs sales, helping businesses efficiently manage their inventory. Built on MySQL for the backend, PerishTrack integrates seamlessly with Prometheus and Grafana for real-time monitoring and visualization.

Features
--------

-   **Inventory Management**: Easily track stock levels, item categories, and expiration dates.
-   **Waste Management**: Automatically log expired goods into the waste table to minimize losses.
-   **Supplier Management**: Store and manage supplier details, including contact information.
-   **Sales Tracking**: Track sold items and automatically update stock levels.
-   **Automated Reordering**: Set thresholds for automatic reordering of low-stock items.
-   **Monitoring**: Integrates with Prometheus and Grafana for live monitoring of database performance.

System Requirements
-------------------

-   **MySQL** 8.0 or higher for the database backend
-   **Prometheus** for collecting and monitoring database metrics
-   **Grafana** for visualizing performance and resource usage
-   **Shell access** to execute automation scripts
-   **Apache JMeter** for load and performance testing
-   **Git** for version control and collaboration

Installation and Setup
----------------------

### 1\. Clone the Repository

To begin, clone the PerishTrack repository to your local environment:

bash

Copy code

`git clone https://github.com/yourusername/PerishTrack.git
cd PerishTrack`

### 2\. Database Setup

Create and set up a MySQL database, then import the necessary SQL files to initialize the system.

#### Step 1: Log in to MySQL

Log into MySQL from the terminal using root or appropriate user privileges:

bash

Copy code

`mysql -u root -p`

#### Step 2: Create the Database

Once logged in, create a new database called `perishtrack_db`:

sql

Copy code

`CREATE DATABASE perishtrack_db;`

#### Step 3: Import Database Schema and Data

After creating the database, import the schema and initial data:

bash

Copy code

`mysql -u root -p perishtrack_db < ./sql/create_tables.sql
mysql -u root -p perishtrack_db < ./sql/insert_data.sql`

#### Step 4: Load Stored Procedures and Triggers

Lastly, load the stored procedures and triggers into the database:

bash

Copy code

`mysql -u root -p perishtrack_db < ./sql/stored_procedures.sql
mysql -u root -p perishtrack_db < ./sql/triggers.sql`

### 3\. Backup and Restore

#### Backup the Database

To create a backup of your database, use the provided shell script:

bash

Copy code

`./scripts/backup_db.sh`

This will generate a backup and save it in the `sql/backups/` directory.

#### Restore the Database

To restore the database from a backup file, run the following command:

bash

Copy code

`mysql -u root -p perishtrack_db < ./sql/backups/backup_YYYY-MM-DD.sql`

### 4\. Continuous Integration (CI) Setup

PerishTrack uses **GitHub Actions** for continuous integration, ensuring that any changes to the database schema or stored procedures are automatically applied when code is pushed to the repository.

#### Setting Up GitHub Secrets

To configure GitHub Actions for automatic database migration, you'll need to add the following environment variables to your GitHub repository secrets:

1.  Go to your repository on GitHub.
2.  Navigate to **Settings** > **Secrets** > **New repository secret**.
3.  Add the following secrets:
    -   `DB_HOST`
    -   `DB_USER`
    -   `DB_PASSWORD`
    -   `DB_NAME`

### 5\. Monitoring Setup

#### Prometheus Configuration

To monitor database performance, install Prometheus and configure it to collect metrics from your MySQL database:

1.  Install Prometheus on your server.
2.  Add the configuration found in `prometheus_config.yml` to your Prometheus instance.
3.  Ensure Prometheus scrapes metrics from MySQL and your system's node exporter for CPU and memory usage.

#### Grafana Setup

To visualize performance data, install Grafana and set up the provided dashboard:

1.  Install Grafana on your server.
2.  Import the `grafana_dashboard.json` file to visualize MySQL performance metrics and system statistics.

### 6\. Load Testing

#### JMeter Setup

To ensure system stability under load, use Apache JMeter for performance testing:

1.  Download and install **Apache JMeter**.
2.  Open JMeter and load the `tests/load_testing_plan.jmx` file.
3.  Customize parameters like the number of users and duration to suit your testing needs.
4.  Run the load test to simulate multiple concurrent users and analyze system performance.

Troubleshooting
---------------

### Common Issues

-   **Connection Problems**: If you're having trouble connecting to the MySQL server, ensure it's running and the credentials in both your local environment and GitHub Secrets are correct.
-   **Backup Failures**: Check that the `sql/backups/` directory has the necessary write permissions and sufficient storage space.

Contributing
------------

We welcome contributions to PerishTrack! If you'd like to contribute, please fork the repository and submit a pull request. We encourage improvements in code, documentation, and features.

License
-------

This project is licensed under the MIT License. For more details, see the <LICENSE> file.
