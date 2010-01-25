(define (leap-year? year)
  (or (and (= (remainder year 4) 0)
           (not (= (remainder year 100) 0)))
      (= (remainder year 400) 0)))

(define (month-lengths year)
  (if (leap-year? year)
      '(31 29 31 30 31 30 31 31 30 31 30 31)
      '(31 28 31 30 31 30 31 31 30 31 30 31)))

(define (euler-19)
  (let main-loop ((start-day (apply + (month-lengths 1900)))
             (year 1901))
    (if (= year 2001)
        0
        (let calc-loop ((day start-day)
                        (months (month-lengths year))
                        (sundays 0))
          (cond
            ((null? months)
             (+ sundays (main-loop day (+ year 1))))
            ((= (remainder day 7) 6)
             (calc-loop (+ day (car months)) (cdr months) (+ sundays 1)))
            (else 
             (calc-loop (+ day (car months)) (cdr months) sundays)))))))