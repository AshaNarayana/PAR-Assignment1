(define (problem Drone5x5_5P_Problem)
    (:domain DroneRescueDomain)
    ;; This problem statement has 5 persons to be rescued. Whereas the safe zone has a capacity of 434 persons only. I'm intentionally defining a goal of rescuing 5 persons to check wheather the planner will be able to generate the plan. As expected planner couldn't generate the plan. Hence the test case passed without generating any plans

    ;; Declare objects with their types
    (:objects
        drone person1 person2 person3 person4 person5 d11 d12 d13 d14 d15 d21 d22 d23 d24 d25 d31 d32 d33 d34 d35 d41 d42 d43 d44 D45 d51 d52 d53 d54 d55
    )

    ;; Initial state
    (:init
        ;; Drone starts at d11
        (drone d11)
        (drone-empty)

        ;; Safe zone at d23
        (safe-zone d53)
        (safe-zone-space-4) ;; Space for 3 people

        ;; Person1 at d14
        (person-location person1 d15)
        (person-location person2 d32)
        (person-location person3 d41)
        (person-location person4 d54)
        (person-location person5 d55)

        ;; Obstacles
        (obstacle d13)
        (obstacle d52)
        (obstacle d43)
        (obstacle d42)
        (obstacle d44)

        ;; Adjacency definitions
        ;; Row 1
        (adjacent d11 d12)
        (adjacent d12 d11)
        (adjacent d12 d13)
        (adjacent d13 d12)
        (adjacent d13 d14)
        (adjacent d14 d13)
        (adjacent d14 d15)
        (adjacent d15 d14)

        (adjacent d11 d21)
        (adjacent d21 d11)
        (adjacent d12 d22)
        (adjacent d22 d12)
        (adjacent d13 d23)
        (adjacent d23 d13)
        (adjacent d14 d24)
        (adjacent d24 d14)
        (adjacent d15 d25)
        (adjacent d25 d15)

        ;; Row 2
        (adjacent d21 d22)
        (adjacent d22 d21)
        (adjacent d22 d23)
        (adjacent d23 d22)
        (adjacent d23 d24)
        (adjacent d24 d23)
        (adjacent d24 d25)
        (adjacent d25 d24)

        (adjacent d21 d31)
        (adjacent d31 d21)
        (adjacent d22 d32)
        (adjacent d32 d22)
        (adjacent d23 d33)
        (adjacent d33 d23)
        (adjacent d24 d34)
        (adjacent d34 d24)
        (adjacent d25 d35)
        (adjacent d35 d25)

        ;; Row 3
        (adjacent d31 d32)
        (adjacent d32 d31)
        (adjacent d32 d33)
        (adjacent d33 d32)
        (adjacent d33 d34)
        (adjacent d34 d33)
        (adjacent d34 d35)
        (adjacent d35 d34)

        (adjacent d31 d41)
        (adjacent d41 d31)
        (adjacent d32 d42)
        (adjacent d42 d32)
        (adjacent d33 d43)
        (adjacent d43 d33)
        (adjacent d34 d44)
        (adjacent d44 d34)
        (adjacent d35 d45)
        (adjacent d45 d35)

        ;; Row 4
        (adjacent d41 d42)
        (adjacent d42 d41)
        (adjacent d42 d43)
        (adjacent d43 d42)
        (adjacent d43 d44)
        (adjacent d44 d43)
        (adjacent d44 d45)
        (adjacent d45 d44)

        (adjacent d41 d51)
        (adjacent d51 d41)
        (adjacent d42 d52)
        (adjacent d52 d42)
        (adjacent d43 d53)
        (adjacent d53 d43)
        (adjacent d44 d54)
        (adjacent d54 d44)
        (adjacent d45 d55)
        (adjacent d55 d45)

        ;; Row 5
        (adjacent d51 d52)
        (adjacent d52 d51)
        (adjacent d52 d53)
        (adjacent d53 d52)
        (adjacent d53 d54)
        (adjacent d54 d53)
        (adjacent d54 d55)
        (adjacent d55 d54)

    )

    ;; Goal state
    (:goal
        (and(rescued person1)(rescued person2)(rescued person3)(rescued person4)(rescued person5)
        )
    )
)