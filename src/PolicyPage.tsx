import { useEffect, useState } from "react";
import { copyWith, PolicyState } from "./reactivity/PolicyState";
import { PolicyStatus } from "./reactivity/PolicyStatus";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";

export default function PolicyPage({ path }: { path: string }) {
  const [state, changeState] = useState<PolicyState>({
    data: null,
    status: PolicyStatus.Initial,
  });

  const getPolicy = async () => {
    changeState(copyWith(state, { status: PolicyStatus.Processing }));

    const url = `https://raw.githubusercontent.com/pedrolemoz/pedrolemoz.github.io/refs/heads/master/assets/${path}`;
    const response = await fetch(url);

    if (response.status != 200) {
      changeState(copyWith(state, { status: PolicyStatus.Error }));
      return;
    }

    const policy = await response.text();

    console.log(policy);

    changeState(
      copyWith(state, { status: PolicyStatus.Success, data: policy })
    );
  };

  useEffect(() => {
    getPolicy();
  }, []);

  if (
    state.status == PolicyStatus.Initial ||
    state.status == PolicyStatus.Processing ||
    state.status == PolicyStatus.Error
  ) {
    return (
      <main className="bg-[#10002b] text-[#e3e8f0] min-h-screen w-full"></main>
    );
  }

  const policy = state.data!;

  return (
    <main className="bg-[#10002b] text-[#e3e8f0]">
      <div className="max-w-7xl m-auto flex flex-col gap-4 p-8">
        <ReactMarkdown
          remarkPlugins={[remarkGfm]}
          components={{
            h1: ({ node, ...props }) => (
              <h1 className="text-5xl md:text-7xl font-bold" {...props} />
            ),
            h2: ({ node, ...props }) => (
              <h2 className="text-2xl font-bold" {...props} />
            ),
            h3: ({ node, ...props }) => (
              <h3 className="text-xl font-bold" {...props} />
            ),
            h4: ({ node, ...props }) => (
              <h4 className="text-sm uppercase font-bold" {...props} />
            ),
            ul: ({ node, ...props }) => (
              <ul className="text-lg text-[#b0b9c7]" {...props} />
            ),
            p: ({ node, ...props }) => (
              <p className="text-lg text-justify text-[#b0b9c7]" {...props} />
            ),
            a: ({ node, ...props }) => (
              <a className="text-[#b0b9c7] hover:text-[#e3e8f0]" {...props} />
            ),
          }}
        >
          {policy}
        </ReactMarkdown>
      </div>
    </main>
  );
}
