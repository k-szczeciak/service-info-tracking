### Main goal
Ease and fast access to all information concenrning for customer service for convinence and managing. Ease fo fast data input and matching
***
### Scope
Web service for storing and tracking information related to customer service activities. Web service tracks physical item or case with vital informations as comments, documentation (photos, videos, pdf-s). It allows to create, edit and view components matching requirements and authorisations. Aggregate documents, processes and display statictics. With scenarios process flow controll is possible.
***
### Features
* User account and authoristaion profiles
* process splitted into workstations for tracking and flow control
* Operation monitoring/tracking - operation status change tracking for statistics and evaluation
* Adding comments to Item/Case
* Adding documents for each Item/Case - file based - each Item/Case has its own folder (preview)
* forms validation
* email sending for for status change
* QRcode for fast tracking and access using e.g. smartphone
* Statistics/charts
* views:
    - workstations aggregated display
    - Work station view
    - User view
    - Item view
    - comments / docs / operations
    - statistics
***
### How to start
* create mysql DB "projekt" and connect
* some data maight be necessary to add to run application propoerly
* run tomcat
***
### To be done
* item active as separate table or modifyer?
* item time on place
* items aggegated time on header
* create Item Card (bootstrap)
* person avatar attached to item card
* customer view with email notification
* users and authorisations
* statistics - charts - number of items per station, mean time,...
* prediction
* interface with warehouse
