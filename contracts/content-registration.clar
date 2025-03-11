;; Content Registration Contract

;; Data Variables
(define-map contents principal (string-ascii 256))
(define-data-var content-count uint u0)

;; Public Functions
(define-public (register-content (content-hash (string-ascii 256)))
  (let ((caller tx-sender))
    (if (is-none (map-get? contents caller))
      (begin
        (map-set contents caller content-hash)
        (var-set content-count (+ (var-get content-count) u1))
        (ok true))
      (err u403))))

(define-read-only (get-content (owner principal))
  (ok (map-get? contents owner)))

(define-read-only (get-content-count)
  (ok (var-get content-count)))

