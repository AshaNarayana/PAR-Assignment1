(define (domain DroneRescueDomain)

    ;; Define necessary requirements
    (:requirements :strips :negative-preconditions :equality :conditional-effects :disjunctive-preconditions)

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
        ;; These predicates simulate the capacity, allowing for dynamic grid sizes
        (safe-zone-space-5) ;; Safe zone has space for 5 more people
        (safe-zone-space-4) ;; Safe zone has space for 4 more people
        (safe-zone-space-3) ;; Safe zone has space for 3 more people
        (safe-zone-space-2) ;; Safe zone has space for 2 more people
        (safe-zone-space-1) ;; Safe zone has space for 1 more person
        (safe-zone-full) ;; Safe zone is full
        (drone-rest ?d) ;; The drone is resting
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
        :effect (and (picked ?p) (drone-full) (not (drone-empty)) (not (person-location ?p ?d)))
    )

    ;; Dynamic Drop-Off Action: Adjusts for any grid size
    (:action drop-off
        :parameters (?p ?d)
        :precondition (and
            (drone-full)
            (picked ?p)
            (drone ?d)
            (safe-zone ?d)
            (not (rescued ?p))
            ;; Check for at least one free space in the safe zone
            (or (safe-zone-space-5) (safe-zone-space-4) (safe-zone-space-3) (safe-zone-space-2) (safe-zone-space-1))
        )
        :effect (and
            (rescued ?p)
            (drone-empty)
            (not (drone-full))
            ;; Only one of these will apply based on which space is available
            (when
                (safe-zone-space-5)
                (and(not (safe-zone-space-5))
                    (safe-zone-space-4)))
            (when
                (safe-zone-space-4)
                (and(not (safe-zone-space-4))
                    (safe-zone-space-3)))
            (when
                (safe-zone-space-3)
                (and(not (safe-zone-space-3))
                    (safe-zone-space-2)))
            (when
                (safe-zone-space-2)
                (and(not (safe-zone-space-2))
                    (safe-zone-space-1)))
            (when
                (safe-zone-space-1)
                (and(not (safe-zone-space-1))
                    (safe-zone-full)))
        )
    )

    ;; Action: Rest the drone in the safe zone after all persons are rescued or zone is full
    (:action rest-drone
        :parameters (?d)
        :precondition (and
            (drone ?d)
            (safe-zone ?d)
            (drone-empty) ;; Ensure the drone is empty to rest
            ;; Check if the safe zone is full or all people are rescued
            (safe-zone-full)
        )
        :effect (and
            (drone-rest ?d) ;; Indicate the drone is now resting
        )
    )

)