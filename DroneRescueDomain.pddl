(define (domain DroneRescueDomain)

    ;; Define necessary requirements
    (:requirements :strips :typing :negative-preconditions :equality :conditional-effects)

    ;; Define types

    ;; Define predicates
    (:predicates
        (drone-empty) ;; The drone is empty
        (drone-full) ;; The drone is full
        (drone ?d) ;; Drone location
        (person-location ?p ?d) ;; A person is located at ?d
        (obstacle ?d) ;; An obstacle at ?d
        (safe-zone ?d) ;; Safe zone location
        (adjacent ?d1 ?d2) ;; Adjacency between two locations
        (rescued ?p) ;; A person has been rescued
        (picked ?p) ;; A person has been picked
    )

    ;; Action: Move the drone from one location to another adjacent location
    (:action move-forward
        :parameters (?d1 ?d2)
        :precondition (and (drone ?d1) (adjacent ?d1 ?d2) (not (obstacle ?d2)))
        :effect (and (drone ?d2) (not (drone ?d1)))
    )
    (:action move-backward
        :parameters (?d1 ?d2)
        :precondition (and (drone ?d1) (adjacent ?d2 ?d1) (not (obstacle ?d2)))
        :effect (and (drone ?d2) (not (drone ?d1)))
    )

    ;; Action: Pick up a person
    (:action pick-up
        :parameters (?p ?d)
        :precondition (and (person-location ?p ?d) (drone ?d) (drone-empty))
        :effect (and (picked ?p)(drone-full) (not(drone-empty)) (not (person-location ?p ?d)))
    )

    ;; Action: Drop off a person at the safe zone
    (:action drop-off
        :parameters (?d ?p)
        :precondition (and (drone-full)(not(drone-empty)) (picked ?p) (drone ?d) (safe-zone ?d) (not (rescued ?p)))
        :effect (and (rescued ?p) (drone-empty)
            (not(picked ?p)))
    )
)