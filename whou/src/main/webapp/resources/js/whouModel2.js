/**
 * 
 */ 
 
 import { GLTFLoader } from 'https://cdn.skypack.dev/three@0.129.0/examples/jsm/loaders/GLTFLoader.js';
 
    const object = new THREE.Object3D();
        const canvas = document.querySelector('.webgl')
        const scene = new THREE.Scene()
        // 각도를 라디안으로 반환
        const degreesToRadians = (degrees) => { 
            return degrees * (Math.PI / 180)
        }

        const sizes = {
             width: window.innerWidth,
            height: window.innerHeight
        }

         // Renderer
        const renderer = new THREE.WebGLRenderer({ canvas, alpha: true, antialias: true })
		renderer.background = new THREE.Color(0x00000000);
        const render = () => {
	
            renderer.setSize(sizes.width, sizes.height)
            renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
            renderer.render(scene, camera)
        }

        // Camera
        const camera = new THREE.PerspectiveCamera(50, sizes.width / sizes.height, 0.1, 1000)
        // 카메라 위치 조정 ( 작을수록 가까워짐 )
        camera.position.set(modelCamera_x,modelCamera_y,modelCamera_z);
        scene.add(camera)
		// Update sizes
            sizes.width = modelWidth
            sizes.height = modelHeight

            // Update camera
            camera.aspect = sizes.width / sizes.height
            camera.updateProjectionMatrix()


        // 마우스 카메라 조정
        const controls = new THREE.OrbitControls(camera, renderer.domElement);
        controls.rotateSpeed = 1.0; // 마우스로 카메라를 회전시킬 속도입니다. 기본값(Float)은 1입니다.
        controls.zoomSpeed = 1.2; // 마우스 휠로 카메라를 줌 시키는 속도 입니다. 기본값(Float)은 1입니다.
        controls.panSpeed = 0.8; // 패닝 속도 입니다. 기본값(Float)은 1입니다.
        controls.minDistance = 5; // 마우스 휠로 카메라 거리 조작시 최소 값. 기본값(Float)은 0 입니다.
        controls.maxDistance = 100; // 마우스 휠로 카메라 거리 조작시 최대 값. 기본값(Float)은 무제한 입니다.

        animate();

        function animate() {
                requestAnimationFrame(animate);
                object.rotation.x += 0.01;
                object.rotation.y += 0.01;
                renderer.render(scene, camera);
                controls.update();
        }

        // Material
        // const material = new THREE.MeshLambertMaterial({ color: 0xffffff })

        // Lighting
        const lightAmbient = new THREE.AmbientLight(0x9eaeff,0.8)
        scene.add(lightAmbient)

        const lightDirectional = new THREE.DirectionalLight(0xffffff, 1)
        scene.add(lightDirectional)

        // Move the light source towards us
        // 빛 좌표 조정
        lightDirectional.position.set(5, 5, 5)

        // Figure
        class Figure {
            constructor(params) {
                this.params = {
                    x: 0,
                    y: 0,
                    z: 0,
                    ry: 0,
                    ...params
                }
                
                // Create group and add to scene
                this.group = new THREE.Group()
                scene.add(this.group)
                
                // Position according to params
                this.group.position.x = this.params.x
                this.group.position.y = this.params.y
                this.group.position.z = this.params.z
                // this.group.rotation.y = this.params.ry
                // this.group.scale.set(5, 5, 5)
                
                // Material
                // 색을 바꿀 수 있는 변수
                this.headHue = 290
                this.bodyHue = 290
                this.headLightness = 30 // 명도

                // 색깔 `hsl(290, 85%, 50%)`
                // 투명도 0x00ff00, transparent: true, opacity: 0
                this.headMaterial = new THREE.MeshLambertMaterial({ color: armColor }) // 팔 색
                // this.bodyMaterial = new THREE.MeshLambertMaterial({ color: `hsl(290, 85%, 50%)` })
                this.bodyMaterial = new THREE.MeshLambertMaterial({ color: headColor}) // 얼굴 색
                // 
                this.arms = []
            }
   
            createBody() {
                this.body = new THREE.Group();

                // 몸의 기본 형태를 생성합니다.
                const bodyGeometry = new THREE.SphereBufferGeometry(1.5, 32, 32);
                const bodyMaterial = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
                const bodyMesh = new THREE.Mesh(bodyGeometry, this.bodyMaterial);
                
                this.body.add(bodyMesh);

                this.group.add(this.body);

                this.createLegs();
                this.createEyes();
                this.createCheek();
                this.createMouth();         
            }
            
            createCheek() {
                const cheeks = new THREE.Group();
                const geometry = new THREE.SphereGeometry(0.13, 12, 20);
                const material = new THREE.MeshLambertMaterial({ color: cheekColor }); // 볼 색

                for (let i = 0; i < 2; i++) {
                    const cheek = new THREE.Mesh(geometry, material);
                    const m = i % 2 === 0 ? 1 : -1;
                    const cheeksSpacing = 0.28;
                    cheeks.scale.set(2, 1, 1);

                    cheeks.add(cheek);
                    cheek.position.x = m * cheeksSpacing;
                }      

                this.body.add(cheeks);

                cheeks.position.y = 0;
                cheeks.position.z = 1.28;
            }

            createMouth() {
                const mouth = new THREE.Group();
                const geometry = new THREE.SphereGeometry(0.13, 12, 20);
                const textureLoader = new THREE.TextureLoader();
                const texture = textureLoader.load('/whou/resources/img/mouth.png'); // 입 이미지 텍스처
                const material = new THREE.MeshLambertMaterial({
                    map: texture
                });
                mouth.scale.set(1, 1.5, 1);
                const mouthMesh = new THREE.Mesh(geometry, material);
                mouth.add(mouthMesh);

                this.body.add(mouth);

                mouth.position.y = -0.1;
                mouth.position.z = 1.4;
            }

            createHead() {
                // Create a new group for the head
                this.head = new THREE.Group()
                
                // Create the main cube of the head and add to the group
                const geometry = new THREE.SphereGeometry(0)
                const headMain = new THREE.Mesh(geometry, this.headMaterial)
                this.head.add(headMain)
                
                // Add the head group to the figure
                this.group.add(this.head)
                
                // Position the head group
                this.head.position.y = 1.65

            }
            
            createArms() {
                const radiusX = 1; // X 축 반지름
                const radiusY = 0.5; // Y 축 반지름
                const radiusZ = 0.5; // Z 축 반지름
                const widthSegments = 32;
                const heightSegments = 32;
                
                for(let i = 0; i < 2; i++) {
                    const armGroup = new THREE.Group()
                    const geometry = new THREE.SphereGeometry(radiusX, widthSegments, heightSegments);
                    geometry.scale(radiusX, radiusY, radiusZ); // X, Y, Z 축에 각각 다른 반지름 적용
                    const arm = new THREE.Mesh(geometry, this.headMaterial)
                    const m = i % 2 === 0 ? 1 : -1
                    
                    // Add arm to group
                    armGroup.add(arm)
										
                    
                    // Add group to figure
                    this.body.add(armGroup)
                    
                    // Translate the arm by half the height
                    arm.position.y = 0
                    
                    // Position the arm relative to the figure
                    armGroup.position.x = m * 0.9
                    armGroup.position.y = 0.1
                    armGroup.position.z = 0.4

                    // Rotate the arm
                    armGroup.rotation.z = degreesToRadians(30*m)
                    armGroup.rotation.x = 1

                    // Push to the array
                    this.arms.push(armGroup)
                    if(i === 1){
                    	let loader = new GLTFLoader();
						loader.load(modelPath, function(gltf){
						const model = gltf.scene; // 로드한 glTF 모델
					
						if(modelColor != null){
							model.traverse(function(child) {
        						if (child.isMesh) {
            					const material = child.material;
            					material.color.set(modelColor); // 색상 변경
            					material.needsUpdate = true; // 변경 사항 업데이트
        					}
    					});
					}
   						model.scale.set(modelScale_x, modelScale_y, modelScale_z); // x, y, z 크기 조절
	    				model.position.set(modelPosition_x, modelPosition_y, modelPosition_z); // x = 좌우, y = 위아래, z = 앞뒤 이동
						model.rotation.set(modelRotation_x, modelRotation_y, modelRotation_z);
				    	if(modelMotion == 0){
				    		scene.add(model);
						}else{
							arm.add(model);
						}
						});
                	} // for end
                }
					
            }
          	createEyes() {
                const eyes = new THREE.Group();
                const geometry = new THREE.SphereGeometry(0.2, 12, 20);

                const textureLoader = new THREE.TextureLoader();
                const texture = textureLoader.load('/whou/resources/img/eye.png'); // 단색 텍스처 예시

                const material = new THREE.MeshLambertMaterial({ map: texture });

                for (let i = 0; i < 2; i++) {
                    const eye = new THREE.Mesh(geometry, material);
                    const m = i % 2 === 0 ? 1 : -1;
                    const eyeSpacing = 0.25;
                    eye.scale.set(1, 2, 1);

                    eyes.add(eye);
                    eye.position.x = m * eyeSpacing;
                }

                this.body.add(eyes);

                eyes.position.y = 0.3;
                eyes.position.z = 1.3;
            }
                        
            createLegs() {
                const legs = new THREE.Group()

                const radius = 1; // 다리 반지름
                const widthSegments = 16;
                const heightSegments = 16;
                const phiStart = 0;
                const phiLength = Math.PI;
                const thetaStart = 0;
                const thetaLength = Math.PI;

                const geometry = new THREE.SphereBufferGeometry(
                    radius,
                    widthSegments,
                    heightSegments,
                    phiStart,
                    phiLength,
                    thetaStart,
                    thetaLength
                );

                const legMaterial = new THREE.MeshLambertMaterial({
                    color: legColor // 다리 색
                });

                // 다리 간격
                const legSpacing = 1.3; 

                for(let i = 0; i < 2; i++) {
                    const leg = new THREE.Mesh(geometry, legMaterial)

                    const m = i % 2 === 0 ? 1 : -1
                    legs.scale.set(0.8, 0.5, 0.5);
                    legs.add(leg)
                    leg.position.x = m * legSpacing
                    leg.position.y = -0.3
                    leg.position.z = 0.8
                    leg.rotation.x = 11;                  

                }
                
                this.group.add(legs)
                legs.position.y = -1.15             

            }
                   
            bounce() {
                this.group.rotation.y = this.params.ry
                this.group.position.y = this.params.y
                this.arms.forEach((arm, index) => {
                    const m = index % 2 === 0 ? 1 : -1
                    arm.rotation.z = this.params.armRotation * m
                })
            }
            
            init() {
                this.createBody()
                this.createHead()
                this.createArms()
                // this.createStar()
            }
        }

        const figure = new Figure()
        figure.init()

        gsap.set(figure.params, {
            // y: -1.5
        })

    
        // 팔회전
        gsap.to(figure.params, {
            y: 0,
            armRotation: degreesToRadians(45),
            repeat: -1,
            yoyo: true,
            duration: 0.8
        })
           // 몸 회전
        gsap.to(figure.params, {
            ry: degreesToRadians(360),
            repeat: -1,
            duration: 0.8
        })
        

        gsap.ticker.add(() => {
            figure.bounce()
            render()
        })
        
    