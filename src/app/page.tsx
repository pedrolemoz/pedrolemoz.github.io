import Image from 'next/image'
import styles from './page.module.css'

export default function Home() {
  return (
    <main className={styles.main}>
      <aside className={styles.information}>
        <div>
          <h1 className={styles.title}>Pedro Lemos</h1>
          <h2 className={styles.bio}>Computer Scientist and Software Engineer at FTeam</h2>
          <span className={styles.shortDescription}>Mobile Developer</span>
          <nav>
            <ul>
              <li>{"About".toUpperCase()}</li>
              <li>{"Education".toUpperCase()}</li>
              <li>{"Experiences".toUpperCase()}</li>
            </ul>
          </nav>
        </div>
        <div>
          <ul>
            <li>GitHub</li>
            <li>LinkedIn</li>
            <li>E-Mail</li>
            <li>Resume (English)</li>
            <li>Resume (Portuguese)</li>
          </ul>
        </div>
      </aside>
      <div className={styles.data}>
        <div>
          <h3 className={styles.sectionName}>{"About".toUpperCase()}</h3>
          <p className={styles.sectionFullDescription}>
            I have a Bachelor’s degree in Computer Science from the Instituto Federal de Educação, Ciência e Tecnologia do
            Ceará (IFCE). I started my journey in programming in 2018, and since the end of 2019, I have been focusing my
            efforts on mobile app development, primarily using the Flutter framework with the Dart language. Throughout my
            career, I have explored various technologies, expanding my knowledge base. I am a computer enthusiast, always
            seeking challenges that allow me to grow professionally. I value good coding practices and believe that clean
            and efficient code is crucial for the success of any project. Additionally, I am passionate about software
            architecture, understanding its importance in building robust and scalable systems.
          </p>
        </div>
        <div>
          <h3 className={styles.sectionName}>{"Education".toUpperCase()}</h3>
          <ul>
            <li className={styles.sectionCard}>
              <Image
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBZYzAHdhHGCmwUki5AoPxzNXP7Ism4ROjKKeaAVe9Ml0tHdy6kgAtrc9qjYHthWk1MmY&usqp=CAU"
                alt="Logo"
                width={80}
                height={80} />
              <div>
                <h4 className={styles.sectionTitle}>Bachelor of Science in Computer Science · Instituto Federal de Educação, Ciência e Tecnologia do Ceará
                </h4>
                <span className={styles.sectionPeriod}>JAN 2019 — DEZ 2023</span>
                <p className={styles.sectionFullDescription}>
                  My undergraduate thesis theme is “Technical analysis of Software Architectures in the development of
                  apps for Smartphones”. I was one of the speakers of COMSOLID/SiC 2022. I talked about SOLID principles,
                  and how to use them in real life projects. Futhermore, I was the auxiliary teacher of the Fundamentals
                  of Programming discipline in 2019. I have a strong interest in Software Engineering, Theory of
                  Computation and Compilers.
                </p>
                <ul>
                  <li>Mobile Development</li>
                  <li>Software Architecture</li>
                  <li>Digital Image Processing</li>
                  <li>Automata Theory</li>
                  <li>Compilers</li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </main>
  )
}
