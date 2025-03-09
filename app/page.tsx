"use client";

import { useEffect, useState } from "react";
import { personDataFromJSON } from "./models/PersonData";
import { copyWith, PersonDataState } from "./reactivity/PersonDataState";
import { PersonDataStatus } from "./reactivity/PersonDataStatus";
import { format } from "date-fns";

export default function Home() {
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

  if (state.status == PersonDataStatus.Initial) {
    return <h1>initial</h1>;
  }

  if (state.status == PersonDataStatus.Processing) {
    return <h1>processing</h1>;
  }

  if (state.status == PersonDataStatus.Error) {
    return <h1>error</h1>;
  }

  const personData = state.data!;

  const formatting = "LLL y";

  return (
    <div className="flex gap-12 max-w-7xl max-h-screen m-auto overflow-hidden">
      <div className="flex-1 py-12">
        <div className="flex flex-col gap-4">
          <h1 className="text-6xl font-bold">
            {personData.firstName} {personData.lastName}
          </h1>
          <h2 className="text-3xl font-medium">{personData.bio}</h2>
        </div>
      </div>

      <div className="flex-1 py-12 overflow-y-auto scrollbar-hide">
        <div className="flex flex-col gap-6">
          <div className="flex flex-col gap-4">
            <h2 className="text-2xl font-bold uppercase">About</h2>
            <p className="text-lg text-justify">{personData.fullDescription}</p>
          </div>

          <div className="flex flex-col gap-4">
            <h2 className="text-2xl font-bold uppercase">Education</h2>

            {personData.education.map((education, index) => (
              <div className="flex gap-4" id={index.toString()}>
                <img
                  className="rounded-lg w-20 h-20"
                  src={education.logo}
                  alt={education.institution}
                />

                <div className="flex flex-col gap-4">
                  <h3 className="text-2xl">
                    {education.degree} in {education.field} @{" "}
                    {education.institution}
                  </h3>

                  <h4 className="text-base uppercase">
                    {format(education.startDate, formatting)} -{" "}
                    {education.endDate != null
                      ? format(education.endDate, formatting)
                      : "Present"}
                  </h4>

                  <p className="text-lg text-justify">
                    {education.description}
                  </p>

                  <div className="flex gap-2 flex-wrap">
                    {education.tags.map((tag, index) => (
                      <div
                        className="text-zinc-950 bg-zinc-50 p-2 rounded-lg text-nowrap font-bold uppercase"
                        id={index.toString()}
                      >
                        {tag}
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            ))}
          </div>

          <div className="flex flex-col gap-4">
            <h2 className="text-2xl font-bold uppercase">Experiences</h2>

            {personData.experiences.map((experience, index) => (
              <div className="flex gap-4" id={index.toString()}>
                <img
                  className="rounded-lg w-20 h-20"
                  src={experience.logo}
                  alt={experience.company}
                />

                <div className="flex flex-col gap-4">
                  <h3 className="text-2xl">
                    {experience.role} @ {experience.company}
                  </h3>

                  <h4 className="text-base uppercase">
                    {format(experience.startDate, formatting)} -{" "}
                    {experience.endDate != null
                      ? format(experience.endDate, formatting)
                      : "Present"}
                  </h4>

                  <p className="text-lg text-justify">
                    {experience.description}
                  </p>

                  <div className="flex gap-2 flex-wrap">
                    {experience.technologies.map((tag, index) => (
                      <div
                        className="text-zinc-950 bg-zinc-50 p-2 rounded-lg text-nowrap font-bold uppercase"
                        id={index.toString()}
                      >
                        {tag}
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
