(define (problem Drone3P3OProblem)
    (:domain DroneRescueDomain)

    ;; Declare objects with their types
    (:objects
        drone obstacle person1 person2 person3 d11 d12 d13 d14 d21 d22 d23 d24 d31 d32 d33 d34 d41 d42 d43 d44
    )

    ;; Initial state
    (:init
        ;; Drone starts at d11
        (drone d11)
        (drone-empty)

        ;; Safe zone at d23
        (safe-zone d41)
        (safe-zone-space-3) ;; Space for 3 people

        ;; Person1 at d14
        (person-location person1 d12)
        (person-location person2 d14)
        (person-location person3 d42)
        ;; Obstacles
        (obstacle d31)
        (obstacle d32)
        (obstacle d24)
        (obstacle d21)
        (obstacle d34)
        (obstacle d44)

        ;; Adjacency definitions
        (adjacent d11 d12)
        (adjacent d12 d13)
        (adjacent d13 d14)
        (adjacent d21 d22)
        (adjacent d22 d23)
        (adjacent d23 d24)
        (adjacent d31 d32)
        (adjacent d32 d33)
        (adjacent d33 d34)
        (adjacent d41 d42)
        (adjacent d42 d43)
        (adjacent d43 d44)

        (adjacent d11 d21)
        (adjacent d21 d31)
        (adjacent d31 d41)
        (adjacent d12 d22)
        (adjacent d22 d32)
        (adjacent d32 d42)
        (adjacent d13 d23)
        (adjacent d23 d33)
        (adjacent d33 d43)
        (adjacent d14 d24)
        (adjacent d24 d34)
        (adjacent d34 d44)
    )

    ;; Goal state: Person1 is rescued
    (:goal
        (and(rescued person1)(rescued person2)(rescued person3)(drone-rest d41)
        )
    )
)