;; Licensing Terms Contract

;; Data Variables
(define-map licenses
  { content-owner: principal, licensee: principal }
  { terms: (string-ascii 256), price: uint })

;; Public Functions
(define-public (create-license (licensee principal) (terms (string-ascii 256)) (price uint))
  (let ((license-key { content-owner: tx-sender, licensee: licensee }))
    (map-set licenses license-key { terms: terms, price: price })
    (ok true)))

(define-read-only (get-license (content-owner principal) (licensee principal))
  (ok (map-get? licenses { content-owner: content-owner, licensee: licensee })))

