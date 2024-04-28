(define (domain elev)
(:requirements :strips :typing :fluents :equality :action-costs :disjunctive-preconditions)

(:types elevator passager status) ;(:types elevador kind crew)

; (:constants p1 p2 p3 - passager)  ;mis can - kind acho que nao precisa definimos no problema como objetos

(:predicates
       (passager_status ?p - passager ?s - status)  
       ;boat_at ?s - side - para dizer se o passageiro ta no elevador ou nao 
)

(:functions
       (elevator_at ?e - elevator)           ; maps one -> 1; two -> 2; none -> 0
       (passager_at ?p - passageiro)
       
       (target_pass ?p - passager)          ;target floor
       (max_pas_elevador)                   ;para comparar
       (highest_floor)                      ;para comparar
       (num_moves)                             ;para mimizar
       - number
)       
;  functions  (crew_vl ?c - crew)           ; maps one -> 1; two -> 2; none -> 0
;        (pop_at ?k - kind ?s - side)
;        (total-cost)
;        - number
; )

 (:action up
    :parameters (?e - elevator )
    :precondition (<= (elevator_at ?e) (highest_floor))
    :effect (and )
  )

(:action move
  :parameters   (?cm ?cc - crew ?f ?t - side)
                
  :precondition (

                )
  :effect       (and
                     
                )
)





; (:action move
;   :parameters   (?cm ?cc - crew ?f ?t - side)
;                 ; cm is the number of mis in the crew
;                 ; cc is the number of can is the crew
;                 ; cm and cc are symbols (none, one, two) and function crew_vl translates them to a number

;   :precondition (and (boat_at ?f)
;                      (not (= ?f ?t))

;                      (>= (pop_at mis ?f) (crew_vl ?cm)) ; there must be cm mis on boat side
;                      (>= (pop_at can ?f) (crew_vl ?cc))
;                      (>= (+ (crew_vl ?cm) (crew_vl ?cc)) 1) ; there must be 1 or 2 in the boat (1<=cm+cc<=2)
;                      (<= (+ (crew_vl ?cm) (crew_vl ?cc)) 2)

;                      ; check the 'from' side
;                      (or (=  (pop_at mis ?f) (crew_vl ?cm))     ; all mis will move OR
;                          (>= (- (pop_at mis ?f) (crew_vl ?cm))  ; the remaining mis should be majority
;                              (- (pop_at can ?f) (crew_vl ?cc)))
;                      )

;                      ; check the 'to' side
;                      (or (=  (+ (pop_at mis ?t) (crew_vl ?cm)) 0)  ; no mis on destination OR
;                          (>= (+ (pop_at mis ?t) (crew_vl ?cm))     ; they will be majority there
;                              (+ (pop_at can ?t) (crew_vl ?cc)))
;                      )

;                 )
;   :effect       (and
;                      (not (boat_at ?f)) (boat_at ?t)
;                      (decrease (pop_at mis ?f) (crew_vl ?cm))
;                      (increase (pop_at mis ?t) (crew_vl ?cm))
;                      (decrease (pop_at can ?f) (crew_vl ?cc))
;                      (increase (pop_at can ?t) (crew_vl ?cc))
;                      (increase (total-cost) 1)
;                 )
; )

; )
