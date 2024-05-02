(define (domain elev)
(:requirements :strips :typing :fluents :equality :action-costs :disjunctive-preconditions :conditional-effects)

(:types elevator passager ) ;(:types elevador kind crew)

; (:constants p1 p2 p3 - passager)  ;mis can - kind acho que nao precisa definimos no problema como objetos


(:predicates
       (inside_elevator ?p - passager)
       (satisfeito ?p - passager)  
       ;boat_at ?s - side - para dizer se o passageiro ta no elevador ou nao 
)

(:functions
       (elevator_at ?e - elevator)           ; maps one -> 1; two -> 2; none -> 0
       (passager_at ?p - passager)
       
       (target_pass ?p - passager)          ;target floor
       (max_pas_elevador)                   ;para comparar
       (highest_floor)                      ;para comparar
       (num_p_inside)                    ;numero de pessoas no elevador
       (num_moves)                             ;para mimizar
       - number
)       
;  functions  (crew_vl ?c - crew)           ; maps one -> 1; two -> 2; none -> 0
;        (pop_at ?k - kind ?s - side)
;        (total-cost)
;        - number
; )

(:action up
    :parameters (?e - elevator )        ;talvez como parametro receber os targets
    :precondition (and (<= (elevator_at ?e) (highest_floor))   ;tem que verificar se existe um target acima ou abaixo na posição do elevador?
    
    )
    :effect (and (increase (elevator_at ?e) 1)
                ; (forall (?p - passenger)
                ; (when (inside_elevator ?p)
                ; (increase (passager_at ?p) 1)  ))
                (increase (num_moves) 1)
                )
  )
 
(:action up_passagers
    :parameters (?e - elevator ?p - passager )        ;talvez como parametro receber os targets
    :precondition (and (inside_elevator ?p)
                       (> (elevator_at ?e) (passager_at ?p))

    )
    :effect (and (increase (passager_at ?p) 1)  
               
                )
  )
 
(:action down
    :parameters (?e - elevator )
    :precondition (>= (elevator_at ?e) 0)
    :effect (and (decrease (elevator_at ?e) 1) 
                ; (forall (?p - passenger)
                ; (when (inside_elevator ?p)
                ; (decrease (passager_at ?p) 1)  ))
                (increase (num_moves) 1))
    
 )

(:action down_passagers
    :parameters (?e - elevator ?p - passager )        ;talvez como parametro receber os targets
    :precondition (and (inside_elevator ?p)
                       (< (elevator_at ?e) (passager_at ?p))

    )
    :effect (and (decrease (passager_at ?p) 1)  
               
                )
  )
 

(:action in
    :parameters (?e - elevator ?p - passager)
    :precondition (and (= (elevator_at ?e) (passager_at ?p))
                  (< (num_p_inside) (max_pas_elevador))
    )
    :effect (and (inside_elevator ?p) 
                (increase (num_p_inside) 1)
    ) ;??
  )

(:action out
    :parameters (?p - passager ?e - elevator)
    :precondition (and (= (target_pass ?p) (passager_at ?p))           
                  (= (elevator_at ?e) (passager_at ?p))
    
    )
    :effect (and  (not (inside_elevator ?p))
                  (decrease (num_p_inside) 1)
                  (satisfeito ?p)
         
  ))

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
