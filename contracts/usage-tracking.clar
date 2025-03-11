;; Usage Tracking Contract

;; Data Variables
(define-map usage-records
  { content-owner: principal, licensee: principal }
  { count: uint })

;; Public Functions
(define-public (record-usage (content-owner principal))
  (let ((usage-key { content-owner: content-owner, licensee: tx-sender }))
    (match (map-get? usage-records usage-key)
      existing-record (map-set usage-records usage-key
                        { count: (+ u1 (get count existing-record)) })
      (map-set usage-records usage-key { count: u1 }))
    (ok true)))

(define-read-only (get-usage (content-owner principal) (licensee principal))
  (ok (map-get? usage-records { content-owner: content-owner, licensee: licensee })))

