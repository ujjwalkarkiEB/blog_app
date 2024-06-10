import '../models/blog.dart';
import '../models/comment.dart';

final List<Blog> dummyDatas = [
  Blog(
    BlogCategory.engineering,
    'assets/images/blogs/blog5.png',
    'Carol White',
    [
      Comment(
        "assets/images/add/user_image.png",
        author: 'John Doe',
        content: 'Great insights on AI!',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Comment(
        "assets/images/add/user_image.png",
        author: 'Jane Smith',
        content: 'I learned a lot from this post.',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ],
    title: 'The Power Of Blockchain',
    content:
        'Recent advancements in civil engineering are paving the way for more sustainable and efficient infrastructure adasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdadasdasdas. Innovations in materials, such as self-healing concrete and carbon fiber reinforcement, are enhancing the durability and longevity of structures. The use of Building Information Modeling (BIM) and other digital tools is improving project planning and execution. These technologies enable engineers to design and construct buildings and infrastructure that are more resilient to environmental challenges. As the world faces increasing urbanization and climate change, civil engineering will play a critical role in developing solutions to these global issues.',
    createdAt: DateTime(2024, 06, 6, 13),
  ),
  Blog(
    BlogCategory.medical,
    'assets/images/blogs/blog2.jpeg',
    'David Brown',
    [
      Comment(
        "assets/images/add/user_image.png",
        author: 'Emily White',
        content: 'This is an interesting perspective on education trends.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Comment(
        "assets/images/add/user_image.png",
        author: 'Michael Brown',
        content: 'Thanks for sharing!',
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      ),
    ],
    title: 'Innovations in Medical Technology',
    content:
        'The medical field is being revolutionized by new technologies, from telemedicine to advanced diagnostic tools. Wearable devices and remote monitoring systems are enabling patients to manage their health more effectively. Artificial intelligence is being used to analyze medical data and provide personalized treatment recommendations. These innovations are improving patient outcomes and making healthcare more accessible. However, the rapid pace of technological change also presents challenges, including ensuring data privacy and security. Ongoing research and collaboration are key to addressing these issues and maximizing the benefits of medical technology.',
    createdAt: DateTime(2024, 6, 3),
  ),
  Blog(
    BlogCategory.technology,
    'assets/images/blogs/blog4.jpeg',
    'Eva Green',
    [
      Comment(
        "assets/images/add/user_image.png",
        author: 'Oliver Green',
        content: 'Engineering is indeed the backbone of modern society.',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
    title: 'Cybersecurity in the Modern Era',
    content:
        'As technology advances, so do the threats in cybersecurity. Cyberattacks are becoming more sophisticated, targeting individuals, organizations, and even nations. It is crucial to develop robust cybersecurity measures to protect sensitive data and systems. This includes implementing strong encryption, multi-factor authentication, and regular security audits. Additionally, there is a growing need for cybersecurity professionals to stay ahead of emerging threats. Education and awareness are also vital in promoting good cybersecurity practices among users. By taking a proactive approach, we can mitigate the risks and safeguard our digital assets.',
    createdAt: DateTime(2024, 5, 30),
    saved: true,
  ),
  Blog(
    BlogCategory.education,
    'assets/images/blogs/blog5.png',
    'Frank Harris',
    [
      Comment(
        "assets/images/add/user_image.png",
        author: 'Sophia Martinez',
        content: 'Medical advancements are crucial for public health.',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ],
    title: 'The Impact of Technology on Education',
    content:
        'Technology is reshaping how students learn and interact. Digital classrooms, online resources, and interactive software are making education more engaging and effective. Students can access a wealth of information and collaborate with peers from around the world. Technology also allows for personalized learning experiences, tailored to individual needs and preferences. However, it is important to address the digital divide and ensure that all students have access to these tools. As technology continues to evolve, it will be essential to develop strategies that maximize its benefits and minimize potential drawbacks.',
    createdAt: DateTime(2023, 1, 20),
  ),
  Blog(
    BlogCategory.engineering,
    'assets/images/blogs/blog6.jpeg',
    'Grace Lee',
    [
      Comment(
        "assets/images/add/user_image.png",
        author: 'Emily White',
        content: 'This is an interesting perspective on education trends.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Comment(
        "assets/images/add/user_image.png",
        author: 'Michael Brown',
        content: 'Thanks for sharing!',
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      ),
    ],
    title: 'Robotics in Engineering',
    content:
        'The integration of robotics in engineering is transforming the industry. Robots are being used in manufacturing, construction, and other sectors to improve efficiency and safety. Advanced robotics systems can perform complex tasks with precision and consistency, reducing the risk of human error. The development of autonomous robots and drones is opening up new possibilities for exploration and monitoring. As robotics technology advances, it is important to consider the ethical and societal implications, including the impact on employment and the need for regulations. By addressing these challenges, we can harness the potential of robotics to drive innovation and progress.',
    createdAt: DateTime(2023, 4, 18),
  ),
  Blog(
    BlogCategory.medical,
    'assets/images/blogs/blog2.jpeg',
    'Henry Wilson',
    [
      Comment(
        "assets/images/add/user_image.png",
        author: 'Emily White',
        content: 'This is an interesting perspective on education trends.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Comment(
        "assets/images/add/user_image.png",
        author: 'Michael Brown',
        content: 'Thanks for sharing!',
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      ),
    ],
    title: 'Telemedicine: The Future of Healthcare',
    content:
        'Telemedicine is becoming more prevalent, offering healthcare services remotely. This technology allows patients to consult with doctors and specialists without the need for in-person visits. Telemedicine is particularly beneficial for those in remote or underserved areas, providing access to medical expertise that may not be otherwise available. It also offers convenience and flexibility for patients with busy schedules. However, the widespread adoption of telemedicine also raises issues related to data privacy, security, and the quality of care. As telemedicine continues to evolve, it will be important to address these challenges and ensure that it complements traditional healthcare services effectively.',
    createdAt: DateTime(2023, 5, 25),
    saved: true,
  ),
];
