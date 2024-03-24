;; bridges-typed.pddl - generalizes the "Seven bridges of
;; Königsberg" problem and uses typing to specify the domain.

(define (domain bridges-typed)
  (:requirements :strips :typing :negative-preconditions)
  (:types land-mass bridge)

  (:predicates
    (connects ?b ?lm1 ?lm2)
    (is-current-location ?lm)
    (bridge-has-been-used ?b)
  )

  (:action cross-bridge
    :parameters (?b - bridge ?lm1 ?lm2 - land-mass)
    :precondition (and
      (connects ?b ?lm1 ?lm2)
      (is-current-location ?lm1)
      (not (bridge-has-been-used ?b))
    )
    :effect (and
      (bridge-has-been-used ?b)
      (not (is-current-location ?lm1))
      (is-current-location ?lm2)
    )
  )
)
