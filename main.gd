extends Node3D

var player: CharacterBody3D

func _ready():
    create_world()
    create_player()
    create_forest()

func create_world():
    var ground = MeshInstance3D.new()
    var mesh = PlaneMesh.new()
    mesh.size = Vector2(200, 200)
    ground.mesh = mesh

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.12, 0.28, 0.12)
    ground.material_override = material
    add_child(ground)

    var light = DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-45, -30, 0)
    add_child(light)

func create_player():
    player = CharacterBody3D.new()
    player.name = "Player"
    player.position = Vector3(0, 1, 0)
    add_child(player)

    var body = MeshInstance3D.new()
    var capsule = CapsuleMesh.new()
    body.mesh = capsule
    player.add_child(body)

    var camera = Camera3D.new()
    camera.position = Vector3(0, 3, 6)
    camera.rotation_degrees = Vector3(-20, 0, 0)
    player.add_child(camera)
    camera.current = true

func create_forest():
    for i in range(80):
        var tree = MeshInstance3D.new()
        var trunk = CylinderMesh.new()
        trunk.top_radius = 0.2
        trunk.bottom_radius = 0.35
        trunk.height = 3
        tree.mesh = trunk

        var material = StandardMaterial3D.new()
        material.albedo_color = Color(0.2, 0.1, 0.04)
        tree.material_override = material

        tree.position = Vector3(
            randf_range(-45, 45),
            1.5,
            randf_range(-45, 45)
        )
        add_child(tree)