(define (problem elev)
   (:domain elev)
   (:objects
        elevator_1 - elevator
        niguem p1 p2 p3 - passager    ;ainda nao sei a necessidade
   )
   (:init ( = (elevator_at elevator_1) 1)
          (= (passager_at p1) 10)
          (= (passager_at p2) 3)
          (= (passager_at p3) 5)

          (not (inside_elevator p1))
          (not (inside_elevator p2))
          (not (inside_elevator p3))

          (not (satisfeito p1))
          (not (satisfeito p2))
          (not (satisfeito p3))

          (= (target_pass p1) 1)
          (= (target_pass p2) 7)
          (= (target_pass p3) 10)
          
          (= (max_pas_elevador) 3)
          (= (highest_floor) 50)
          (= (num_p_inside) 0)

          (= (num_moves) 0)
   )
   (:goal (and (satisfeito p1)
               (satisfeito p2)
               (satisfeito p3)
               


          )
   )
   (:metric minimize (num_moves))
)


;    (:init ( = (elevator_at elevator_1) 1)
;           (= (crew_vl none) 0)
;           (= (crew_vl one) 1)
;           (= (crew_vl two) 2)

;           (= (pop_at mis left)  3)
;           (= (pop_at can left)  3)
;           (= (pop_at mis right) 0)
;           (= (pop_at can right) 0)

;           (= (total-cost) 0)
;    )
;    (:goal (and (= (pop_at mis left)  0)
;                (= (pop_at can left)  0)
;                (= (pop_at mis right) 3)
;                (= (pop_at can right) 3)
;           )
;    )
;    (:metric minimize (total-cost))
; )

