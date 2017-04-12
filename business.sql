SELECT DATE_FORMAT(billing_charged_datetime, '%M') as 'month', SUM(amount) as total_revenue
FROM billing
WHERE MONTH(billing.charged_datetime) = 3
    AND YEAR(billing charged_datetime) = 2012;

SELECT billing.client_id, SUM(amount) AS total_revenue
FROM billing
WHERE billing.client_id = 2;

SELECT site.domain_name, site.client_id
FROM sites
WHERE site.client_id = 10;

SELECT sites.client_id, COUNT(sites.site_id) as num_sites, DATE_FORMAT(sites.created_datetime, '%M'), AS month_created, DATE_FORMAT(sites.created_datetime, '%Y') as year_created
FROM sites
WHERE sites.client_id = 1
GROUP  BY month_created, year_created;

SELECT sites.client_id, DATE_FORMAT(sites.created_datetime, '%M') AS month_created, DATE_FORMAT(site.created_datetime, '%Y') AS year_created, COUNT(sites.site_id) as num_sites
FROM sites
WHERE sites.client_id = 20
GROUP BY month_created, year_created

SELECT sites.domain_name, COUNT(leads.lead) AS num_leads, DATE_FORMAT(leads.registered_datetime, '%M %d, %Y') AS date_registered
FROM sites
LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY sites.site_id;

SELECT CONCAT(client.first_name, '', clients.last_name) AS client_name, COUNT(leads.lead_id) AS num_leads
FROM clients
    LEFT JOIN sites ON clients.client_id = sites.client_id
    JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime  BETWEEN '2011-01-01' AND '2011-12-31' 
ORDER BY clients.client_id;

SELECT CONCAT(clients.first_name, '', clients.last_name) AS client_name, COUNT(leads.lead_id) AS num_leads, DATE_FORMAT(leads.regisstered_datetime, '%M') AS 'month'
FROM clients
    LEFT JOIN sites ON clients.client_id = sites.client_id
    JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-06-30'
GROUP BY clients.client_id, MONTH(leads.registered_datetime)

SELECT CONCAT(clients.first_name, '', clients.last_name) AS client_name, sites.domain_name, COUNT(leads.lead_id) AS num_leads, DATE_FORMAT(leads.registered_datetime, '%M %d, %Y') AS date_registered
FROM clients 
    JOIN sites ON clients.client_id = sites.client_id
    LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY site.domain_name 
ORDER BY clients.client_id;

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, sites.domain_name, COUNT(leads.leads_id) AS num_leads
FROM clients
    JOIN sites ON clients.client_id = sites.client_id
    LEFT JOIN leads ON sites.site_id = leads.site_id
GROUP BY clients.client_id, sites.domain_name;

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, SUM(billing.amount) AS monthly_revenue, DATE_FORMAT(billing.charged_datetime, '%M') AS 'month', DATE_FORMAT(billing.charged_datetime, '%Y') AS 'year'
FROM clients
    LEFT JOIN billing ON clients.client_id = billing.client_id
GROUP BY client_name, MONTH(billing.charged_datetime), YEAR(billing.charged_datetime)
ORDER BY clients.client_id;

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, GROUP_CONCAT(sites.domain_name) AS 'sites'
FROM clients
    LEFT JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;
