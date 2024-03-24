;; euler-koenigsberg.pddl - the classical "Seven bridges of
;; Königsberg" problem

(define (problem euler-koenigsberg)
  (:domain bridges-typed)

  (:objects
    altstadt vorstadt kneiphof lomse - land-mass

    gruene-bruecke kraemerbruecke schmiedebruecke koettelbruecke
    honigbruecke holzbruecke hohe-bruecke - bridge
  )

  (:init
    (connects gruene-bruecke vorstadt kneiphof)
    (connects gruene-bruecke kneiphof vorstadt)
    (connects kraemerbruecke altstadt kneiphof)
    (connects kraemerbruecke kneiphof altstadt)
    (connects schmiedebruecke altstadt kneiphof)
    (connects schmiedebruecke kneiphof altstadt)
    (connects koettelbruecke vorstadt kneiphof)
    (connects koettelbruecke kneiphof vorstadt)
    (connects honigbruecke kneiphof lomse)
    (connects honigbruecke lomse kneiphof)
    (connects holzbruecke altstadt lomse)
    (connects holzbruecke lomse altstadt)
    (connects hohe-bruecke vorstadt lomse)
    (connects hohe-bruecke lomse vorstadt)

    (is-current-location kneiphof)
  )

 (:goal (forall (?b - bridge) (bridge-has-been-used ?b)))
)
