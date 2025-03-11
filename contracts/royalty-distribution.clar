;; Royalty Distribution Contract

;; Data Variables
(define-map royalties principal uint)

;; Public Functions
(define-public (distribute-royalty (content-owner principal) (amount uint))
  (let ((current-balance (default-to u0 (map-get? royalties content-owner))))
    (map-set royalties content-owner (+ current-balance amount))
    (ok true)))

(define-public (withdraw-royalty (amount uint))
  (let ((current-balance (default-to u0 (map-get? royalties tx-sender))))
    (if (>= current-balance amount)
      (begin
        (map-set royalties tx-sender (- current-balance amount))
        ;; In a real contract, you would transfer STX here
        (ok true))
      (err u401))))

(define-read-only (get-royalty-balance (owner principal))
  (ok (default-to u0 (map-get? royalties owner))))

