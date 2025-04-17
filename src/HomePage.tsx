"use client";

import { useEffect, useState } from "react";
import { personDataFromJSON } from "./models/PersonData";
import { copyWith, PersonDataState } from "./reactivity/PersonDataState";
import { PersonDataStatus } from "./reactivity/PersonDataStatus";
import Section from "./Section";
import EducationCard from "./EducationCard";
import ExperienceCard from "./ExperienceCard";
import ExternalButton from "./ExternalButton";

export default function HomePage() {
  const [state, changeState] = useState<PersonDataState>({
    data: null,
    status: PersonDataStatus.Initial,
  });

  const getPersonData = async () => {
    changeState(copyWith(state, { status: PersonDataStatus.Processing }));

    const url =
      "https://raw.githubusercontent.com/pedrolemoz/pedrolemoz.github.io/refs/heads/master/assets/pedrolemoz.json";
    const response = await fetch(url);

    if (response.status != 200) {
      changeState(copyWith(state, { status: PersonDataStatus.Error }));
      return;
    }

    const decodedResponse = await response.json();
    const personData = personDataFromJSON(decodedResponse);

    changeState(
      copyWith(state, { status: PersonDataStatus.Success, data: personData })
    );
  };

  useEffect(() => {
    getPersonData();
  }, []);

  if (
    state.status == PersonDataStatus.Initial ||
    state.status == PersonDataStatus.Processing ||
    state.status == PersonDataStatus.Error
  ) {
    return (
      <main className="bg-[#10002b] text-[#e3e8f0] min-h-screen w-full"></main>
    );
  }

  const personData = state.data!;

  return (
    <main className="bg-[#10002b] text-[#e3e8f0]">
      <div className="max-w-7xl m-auto flex flex-col md:flex-row gap-6">
        {/* Information Section */}
        <section className="flex-1 flex flex-col gap-6 md:py-12 md:px-6 px-6 pt-6">
          <div className="flex flex-col gap-4">
            <h1 className="text-5xl md:text-7xl font-bold">
              {personData.firstName} {personData.lastName}
            </h1>
            <h2 className="text-2xl">{personData.bio}</h2>
          </div>

          <div className="flex flex-col gap-2">
            {personData.contacts.map((contact) => (
              <ExternalButton name={contact.name} url={contact.url} />
            ))}
          </div>
        </section>

        {/* Data Section */}
        <div className="flex-1 flex flex-col gap-4 md:py-12 md:px-6 px-6 pb-6">
          <Section
            label="About"
            content={
              <p className="text-lg text-justify text-[#b0b9c7] font-medium">
                {personData.fullDescription}
              </p>
            }
          />

          <Section
            label="Education"
            content={personData.education.map((education) => (
              <EducationCard education={education} />
            ))}
          />

          <Section
            label="Experiences"
            content={personData.experiences.map((experience) => (
              <ExperienceCard experience={experience} />
            ))}
          />
        </div>
      </div>
    </main>
  );
}
